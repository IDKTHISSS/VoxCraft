//
// Created by IDKTHIS on 05.07.2025.
//

#include "Engine/Application/Application.h"


int main(int argc, char* argv[]) {
    // Initialize the application
    Engine::Application app("VoxCraft Beta", 800, 600);

    // Run the main loop of the application
    app.Run();
}