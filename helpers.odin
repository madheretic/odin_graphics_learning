package main

import rl "vendor:raylib"

// left := rl.Color({255, 0, 0, 255})
// right := rl.Color({0, 0, 255, 255})
// for j: i32 = 0; j < HEIGHT; j += 1 {
// 	for i: f32 = 0; i < WIDTH; i += 1 {
// 		// t = normalized value of i
// 		t := i / WIDTH
// 		// Smooth oscillation:  (sin(time) + 1) / 2     ← eases in and out
// 		// Sawtooth (wrap):     mod(time, 1.0)           ← linear ramp, sharp reset
// 		// Clamped:             clamp(time, 0, 1)        ← plays once and stops
// 		t += f32(math.sin(rl.GetTime() + 1) / 2)
// 		col := Color_Lerp(left, right, t)
// 		rl.DrawPixel(i32(i), j, col)
// 	}
// }

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
