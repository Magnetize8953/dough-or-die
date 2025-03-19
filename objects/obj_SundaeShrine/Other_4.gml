if global.map_generated {
	// Viewport fixing to player location fix code provided by ChatGPT
	if (instance_exists(obj_Player)) {
		camera_set_view_target(view_camera[0], obj_Player);
	} else {
		camera_set_view_target(view_camera[0], noone); // Prevents errors
	}
	audio_play_sound(snd_ShrineChime, 4, false);
	x = room_width / 2;
	y = room_height / 2;
	instance_create_layer(x, y - 302, "Messages", obj_ShrineMessage);
	
} 