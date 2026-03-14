package main
import "core:math"
import rl "vendor:raylib"

WIDTH :: 800
HEIGHT :: 600
TITLE :: "Pixel Lab"

// Lerp creates a smooth gradient between a and b. When t = 0, col = a. When t = 1, col = b.
Color_Lerp :: proc(left: rl.Color, right: rl.Color, t: f32) -> rl.Color {
	r := rl.Lerp(f32(left.r), f32(right.r), t)
	g := rl.Lerp(f32(left.g), f32(right.g), t)
	b := rl.Lerp(f32(left.b), f32(right.b), t)
	a := rl.Lerp(f32(left.a), f32(right.a), t)
	r = rl.Clamp(r, 0, 255)
	g = rl.Clamp(g, 0, 255)
	b = rl.Clamp(b, 0, 255)
	a = rl.Clamp(a, 0, 255)
	return rl.Color({u8(r), u8(g), u8(b), u8(a)})
}

main :: proc() {
	rl.SetConfigFlags({.WINDOW_HIGHDPI})
	rl.InitWindow(WIDTH, HEIGHT, TITLE)

	for !rl.WindowShouldClose() {

		// Multiplying by delta time ensures consistent frame rate.
		dt := rl.GetFrameTime()

		rl.BeginDrawing()

		rl.ClearBackground(rl.BLACK)

		left := rl.Color({255, 0, 0, 255})
		right := rl.Color({0, 0, 255, 255})

		for j: i32 = 0; j < HEIGHT; j += 1 {
			for i: f32 = 0; i < WIDTH; i += 1 {
				// t = normalized value of i
				t := i / WIDTH
				t += f32(math.sin(rl.GetTime() + 1) / 2)
				col := Color_Lerp(left, right, t)
				rl.DrawPixel(i32(i), j, col)
			}
		}

		rl.EndDrawing()
	}

	rl.CloseWindow()
}
