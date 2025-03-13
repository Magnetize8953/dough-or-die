draw_self();
visible = true;
draw_set_color(c_red);
if is_pressed {
	draw_text(x - 102, y - 75, "Big red button pressed!");
// If player is nearby
} else if distance_to_object(obj_Player) < 70 {
	if keyboard_check(ord("E")) {
		if !is_pressed {
			is_pressed = true;
			// Set the corresponding place in the "are buttons pressed?" array to true
			with(obj_Player) {
				buttons_pressed[other.button_num] = true;
			}
			// Switch image to looking pressed down and set timer to undo
			image_index = 1;
			alarm[0] = 250;
		}
		draw_text(x - 102, y - 75, "Big red button pressed!");
	} else {
		draw_text(x - 124, y - 75, "Press the big red button (E)?");
	}
}
