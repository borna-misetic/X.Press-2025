shader_type canvas_item;

uniform float speed = 0.001;

void vertex() {
	UV.x += TIME*speed;
}

void fragment() {

}

//void light() {
//	// Called for every pixel for every light affecting the CanvasItem.
//	// Uncomment to replace the default light processing function with this one.
//}
