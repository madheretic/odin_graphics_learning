package main

// import "core:fmt"
// import "core:math/rand"
// import rl "vendor:raylib"

// WIDTH :: 1280
// HEIGHT :: 800
// SIM_WIDTH :: 320
// SIM_HEIGHT :: 200

// pack_color :: proc(r, g, b: u8) -> u32 {
// 	return u32(r) | u32(g) << 8 | u32(b) << 16 | u32(255) << 24
// }

// set_pixelIndex :: proc(pixels: []u32, i: int, color: u32) {
// 	pixels[i] = color
// }

// set_pixel :: proc(pixels: []u32, x, y: int, color: u32) {
// 	if x < 0 || x >= WIDTH || y < 0 || y >= HEIGHT do return
// 	pixels[y * WIDTH + x] = color
// }


// draw_grid_to_buffer :: proc(pixels: []u32, color: u32) {
// 	// Draw horizontal lines into the buffer
// 	for y := 0; y < HEIGHT; y += 20 {
// 		for x := 0; x < WIDTH; x += 1 {
// 			set_pixel(pixels, x, y, color)
// 		}
// 	}

// 	// Draw vertical lines into the buffer
// 	for x := 0; x < WIDTH; x += 20 {
// 		for y := 0; y < HEIGHT; y += 1 {
// 			set_pixel(pixels, x, y, color)
// 		}
// 	}
// }

// test :: proc() {
// 	rl.SetConfigFlags({.WINDOW_HIGHDPI, .WINDOW_RESIZABLE})
// 	rl.InitWindow(WIDTH, HEIGHT, "pixels")
// 	rl.SetTargetFPS(60)

// 	// pixel buffer
// 	pixels := make([]u32, WIDTH * HEIGHT)
// 	defer delete(pixels)

// 	// 1. "Bake" the grid into your pixel slice once
// 	grid_color := pack_color(150, 150, 150) // Light Gray
// 	draw_grid_to_buffer(pixels, grid_color)

// 	// create GPU texture
// 	image := rl.GenImageColor(WIDTH, HEIGHT, rl.WHITE)
// 	texture := rl.LoadTextureFromImage(image)
// 	rl.UnloadImage(image)
// 	defer rl.UnloadTexture(texture)

// 	// Horizontal, go down from 0 to height
// 	for i := 0; i <= HEIGHT; i += 20 {
// 		rl.DrawLine(0, i32(i), WIDTH, i32(i), rl.Fade(rl.LIGHTGRAY, 0.5))
// 	}

// 	// Vertical, go right from 0 to width
// 	for j := 0; j <= WIDTH; j += 20 {
// 		rl.DrawLine(i32(j), 0, i32(j), HEIGHT, rl.Fade(rl.LIGHTGRAY, 0.5))
// 	}

// 	for !rl.WindowShouldClose() {

// 		// upload pixel buffer to GPU once per frame
// 		rl.UpdateTexture(texture, raw_data(pixels))

// 		rl.BeginDrawing()
// 		rl.ClearBackground(rl.BLACK)

// 		rl.DrawTexture(texture, 0, 0, rl.WHITE)

// 		// fps := fmt.ctprintf("FPS: %d", rl.GetFPS())
// 		// rl.DrawText(fps, 10, 10, 24, rl.YELLOW)
// 		rl.EndDrawing()
// 	}

// 	rl.CloseWindow()
// }
