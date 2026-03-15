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

		mouse := rl.GetMousePosition()
		box_to_mouse := vec2_sub(Vec2{mouse.x, mouse.y}, box_pos)
		// Direction vector facing the mouse from player box
		box_to_mouse_normalized := vec2_normalize(box_to_mouse)

		rl.BeginDrawing()
		rl.ClearBackground(rl.BLACK)

		// Player box
		rl.DrawRectangle(i32(box_pos.x), i32(box_pos.y), box_size, box_size, rl.RAYWHITE)

		// Vector from player box to mouse cursor
		rl.DrawLine(
			i32(box_pos.x) + box_size / 2,
			i32(box_pos.y) + box_size / 2,
			i32(mouse.x),
			i32(mouse.y),
			rl.RED,
		)

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
