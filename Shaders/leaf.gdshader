shader_type canvas_item;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
	vec2 uv = UV;
	uv += sin(uv.y*PI*2.+TIME)*0.01+sin(uv.y*PI*8.+TIME)*0.005;
	uv = fract(uv);
	COLOR = texture(TEXTURE, uv);
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
