shader_type canvas_item;
uniform float move_speed = 0.5;
void vertex() {
  
}

void fragment() {
    COLOR = texture(TEXTURE, UV + vec2(TIME * move_speed, UV.y)); 
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
