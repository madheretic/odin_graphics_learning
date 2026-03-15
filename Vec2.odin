package main

import "core:math"

Vec2 :: struct {
	x: f32,
	y: f32,
}

vec2_add :: proc(a, b: Vec2) -> Vec2 {
	return {a.x + b.x, a.y + b.y}
}

vec2_sub :: proc(a, b: Vec2) -> Vec2 {
	return {a.x - b.x, a.y - b.y}
}

vec2_scale :: proc(v: Vec2, s: f32) -> Vec2 {
	return {v.x * s, v.y * s}
}

vec2_magnitude :: proc(v: Vec2) -> f32 {
	return math.sqrt(v.x * v.x + v.y * v.y)
}

vec2_normalize :: proc(v: Vec2) -> Vec2 {
	magnitude := vec2_magnitude(v)

	// Normalized zero vector is itself.
	if magnitude == 0 {
		return v
	}

	return vec2_scale(v, 1 / magnitude)
}

vec2_wrap :: proc(v: ^Vec2, width: f32, height: f32) {
	if (v.x < 0) {
		v.x = width - 1
	}
	if (v.x > width - 1) {
		v.x = 0
	}
	if (v.y < 0) {
		v.y = height - 1
	}
	if (v.y > height - 1) {
		v.y = 0
	}
}

vec2_dot :: proc(a: Vec2, b: Vec2) -> f32 {
	return a.x * b.x + a.y * b.y
}
