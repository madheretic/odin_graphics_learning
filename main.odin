package main
import "core:math"
import rl "vendor:raylib"

WIDTH :: 800
HEIGHT :: 600
TITLE :: "Pixel Lab"

main :: proc() {
	rl.SetConfigFlags({.WINDOW_HIGHDPI})
	rl.InitWindow(WIDTH, HEIGHT, TITLE)

	box_size: i32 = 20
	box_pos := Vec2{(WIDTH / 2) - f32(box_size) / 2, (HEIGHT / 2) - f32(box_size) / 2}
	speed: f32 = 100

	boost_timer: f32 = 0

	for !rl.WindowShouldClose() {

		// Multiplying by delta time ensures consistent frame rate.
		dt := rl.GetFrameTime()

		direction := Vec2{0, 0}
		if rl.IsKeyDown(.LEFT) {
			direction.x += -1
		}
		if rl.IsKeyDown(.RIGHT) {
			direction.x += 1
		}
		if rl.IsKeyDown(.UP) {
			direction.y += -1
		}
		if rl.IsKeyDown(.DOWN) {
			direction.y += 1
		}
		if (rl.IsKeyDown(.SPACE)) {
			speed += 3
		}

		// Normalize the direction vector
		vec2_normalized := vec2_normalize(direction)
		// Create the velocity vector by scaling by speed and dt (dt for smooth framerate)
		box_velocity := vec2_scale(vec2_normalized, speed * dt)
		// Update position by adding velocity.
		box_pos = vec2_add(box_pos, box_velocity)

		// Bounds check
		vec2_wrap(&box_pos, f32(WIDTH), f32(HEIGHT))

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)
		draw_box(box_pos, box_size, box_size, rl.RAYWHITE)
		rl.EndDrawing()
	}

	rl.CloseWindow()
}
