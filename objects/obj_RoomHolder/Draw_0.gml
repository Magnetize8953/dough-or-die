// Only if cheat code is active, draw
if (global.cheat_code_room_name != noone) {
	if global.cheat_code_room_name {
		draw_text(1600, 10, "Current Room: " + string(room_get_name(self.associated_room)));
	}
}


shader_set(shdr_WallShader);
shader_set_uniform_f_array(_uniColours, _colours); // pass variable _colours to shader as u_rgb

draw_self();
shader_reset();
