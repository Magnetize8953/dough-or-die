if global.map_generated {
	audio_play_sound(snd_ShrineChime, 4, false);
	x = room_width / 2;
	y = room_height / 2;
	instance_create_layer(x, y - 302, "Messages", obj_ShrineMessage);
} 