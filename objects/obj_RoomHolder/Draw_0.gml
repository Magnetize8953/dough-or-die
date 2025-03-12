// Only if cheat code is active, draw
if variable_global_exists("cheat_code_room_name") {
	if global.cheat_code_room_name {
		draw_text(1600, 10, "Current Room: " + string(room_get_name(self.associated_room)));
	}
}



