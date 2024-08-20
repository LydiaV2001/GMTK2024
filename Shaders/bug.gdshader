shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec3 c = texture(TEXTURE, UV).rgb;
	float s = sin(UV.y+TIME*3.+UV.x)-0.8;
	s = clamp(s, 0., 1.);
	COLOR.rgb = c.rgb + s;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
