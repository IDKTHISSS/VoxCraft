#type fragment
#version 450

layout(location = 0) in vec3 fragColor;
layout(location = 0) out vec4 outColor;

void main() {
    outColor = vec4(fragColor, 1.0);
}
#type vertex
#version 450

const vec3 cubeVerts[8] = vec3[](
vec3(-0.5, -0.5, -0.5),
vec3( 0.5, -0.5, -0.5),
vec3( 0.5,  0.5, -0.5),
vec3(-0.5,  0.5, -0.5),
vec3(-0.5, -0.5,  0.5),
vec3( 0.5, -0.5,  0.5),
vec3( 0.5,  0.5,  0.5),
vec3(-0.5,  0.5,  0.5)
);
const uint indices[36] = uint[](
0,2,1, 0,3,2,
4,5,6, 4,6,7,
0,1,5, 0,5,4,
2,3,7, 2,7,6,
0,4,7, 0,7,3,
1,2,6, 1,6,5
);
const vec3 colors[6] = vec3[](
vec3(1,0,0),
vec3(0,1,0),
vec3(0,0,1),
vec3(1,1,0),
vec3(1,0,1),
vec3(0,1,1)
);

layout(set = 0, binding = 0) uniform CameraUBO {
    mat4 view;
    mat4 proj;
} cameraUBO;

layout(push_constant) uniform PushConstants {
    mat4 model;
    float time;
} pc;

layout(location = 0) out vec3 fragColor;

void main() {
    uint idx = indices[gl_VertexIndex];
    vec3 pos = cubeVerts[idx];
    vec3 color = colors[gl_VertexIndex / 6];
    fragColor = color;
    gl_Position = cameraUBO.proj * cameraUBO.view * pc.model * vec4(pos, 1.0);
}