package main

import rl "vendor:raylib"

WIDTH :: 800
HEIGHT :: 600
TITLE :: "Pixel Lab"

main :: proc() {
	rl.SetConfigFlags({.WINDOW_HIGHDPI})
	rl.InitWindow(WIDTH, HEIGHT, TITLE)

	x: f32 = WIDTH / 2
	y: f32 = HEIGHT / 2

	vx: f32 = 200 // Pixels per second, after multiplying by delta time
	vy: f32 = 200 // Pixels per second, after multiplying by delta time

	box_w: i32 = 4
	box_h: i32 = 4


	for !rl.WindowShouldClose() {

		// Multiplying by delta time ensures consistent frame rate.
		dt := rl.GetFrameTime()
		dx := vx * dt
		dy := vy * dt

		if rl.IsKeyDown(.LEFT) {
			x -= dx
		}
		if rl.IsKeyDown(.RIGHT) {
			x += dx
		}
		if rl.IsKeyDown(.UP) {
			y -= dy
		}
		if rl.IsKeyDown(.DOWN) {
			y += dy
		}

		// Bounds check
		if x < 0 {
			x = WIDTH - 1
		}
		if x > WIDTH - 1 {
			x = 0
		}
		if y < 0 {
			y = HEIGHT - 1
		}
		if y > HEIGHT - 1 {
			y = 0
		}

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		rl.DrawRectangle(i32(x), i32(y), box_w, box_h, rl.WHITE)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
