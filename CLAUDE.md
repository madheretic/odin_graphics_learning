# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is an Odin graphics demo using Raylib for pixel manipulation and rendering. The project demonstrates direct pixel buffer operations with GPU texture uploading.

## Build and Run

**Build the project:**
```bash
odin build . -o:speed -out:build/app.exe
```

**Run the executable:**
```bash
./build/app.exe
```

The build output directory is `build/` and must exist before compiling. VS Code tasks are configured to handle this automatically.

## Code Architecture

### Main Loop Pattern
The application follows Raylib's standard game loop:
1. Initialize window and resources (`InitWindow`, `SetTargetFPS`)
2. Create pixel buffer (`make([]u32, WIDTH * HEIGHT)`)
3. Generate GPU texture from buffer (`LoadTextureFromImage`)
4. Main loop: `UpdateTexture` → `BeginDrawing` → draw → `EndDrawing`
5. Cleanup with `defer` statements (`delete`, `UnloadTexture`, `CloseWindow`)

### Pixel Buffer Pattern
- Colors are packed as `u32` in RGBA order (little-endian: ABGR in memory)
- Use `raw_data(pixels)` to pass slices to Raylib's `UpdateTexture`
- Pixel indexing: `pixels[y * WIDTH + x]`

### Odin Conventions Used
- Constants use `::` syntax (`WIDTH :: 1024`)
- Procedures use `proc` keyword (`main :: proc()`)
- `defer` for cleanup (executes at scope exit)
- `do return` for single-statement if bodies
- String formatting with `fmt.ctprintf` for compile-time strings

## Dependencies

- `vendor:raylib` - Raylib bindings for graphics
- `core:fmt` - String formatting
- `core:math/rand` - Random number generation

## VS Code Configuration

The project includes:
- `ols.json` - Odin Language Server configuration
- `.vscode/tasks.json` - Build task (`Ctrl+Shift+B` to build)
- `.vscode/launch.json` - Debug configuration (C++ debugger)
