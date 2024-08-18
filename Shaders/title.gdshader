shader_type canvas_item;

void fragment() {
	float aberration = sin(TIME*0.5)*0.01;
	vec2 uv = UV;
	uv.y += sin(UV.x+TIME*0.1);
	COLOR.r = texture(TEXTURE, uv).r;
	COLOR.g = texture(TEXTURE, uv+aberration).g;
	COLOR.b = texture(TEXTURE, uv-aberration).b;
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
