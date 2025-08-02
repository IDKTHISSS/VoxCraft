#type vertex
#version 450

layout(set = 0, binding = 0) uniform CameraUBO {
    mat4 view;
    mat4 proj;
} cameraUBO;

layout(push_constant) uniform PushConstants {
    mat4 model;
    float time;
} pc;

layout(location = 0) in vec3 inPosition;
layout(location = 1) in vec3 inColor;
layout(location = 2) in vec2 inTexCoord;

layout(location = 0) out vec3 fragColor;
layout(location = 1) out vec2 fragTexCoord;

void main() {
    fragColor = inColor;
    fragTexCoord = inTexCoord;

    gl_Position = cameraUBO.proj * cameraUBO.view * pc.model * vec4(inPosition, 1.0);
}

#type fragment
#version 450

layout(location = 0) in vec3 fragColor;
layout(location = 1) in vec2 fragTexCoord;
layout(location = 0) out vec4 outColor;

void main() {
    // Используем текстурные координаты для создания шахматного узора
    float checkerboard = mod(floor(fragTexCoord.x * 10) + floor(fragTexCoord.y * 10), 2.0);
    vec3 checkerColor = mix(fragColor, fragColor * 0.7, checkerboard);
    outColor = vec4(checkerColor, 1.0);
}
