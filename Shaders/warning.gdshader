shader_type canvas_item;

void fragment() {
	vec3 c = texture(TEXTURE, UV).rgb;
	c += 0.4*ceil(sin(TIME*20.-0.01));
	COLOR.rgb = c;
	
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
