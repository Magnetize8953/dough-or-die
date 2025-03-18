if !is_loaded and instance_exists(obj_Player) {
	// Citation: https://www.youtube.com/watch?v=ni6L1sDCl5E

	// set audio player's info of where the player is
	audio_listener_orientation(0, 0, 1, 0, -1, 0);
	audio_listener_position(obj_Player.x, obj_Player.y, 0);

	// set up the playing/emitting of sound
	var emitter = audio_emitter_create();
	audio_falloff_set_model(audio_falloff_inverse_distance_scaled);
	audio_emitter_falloff(emitter, 100, 1825, 1);
    
    // pause background music
    audio_sound_gain(global.background_music, 0, pausing_speed);
    alarm[0] = pausing_speed;

	// play sound
	music = audio_play_sound_on(emitter, snd_OperaTrack, true, 10);
	audio_emitter_position(emitter, x, y, 0);
	is_loaded = true;
} else if instance_exists(obj_Player) {
	// update audio player's info of where the player is
	audio_listener_position(obj_Player.x, obj_Player.y, 0);

	// If music already exists, unpause it
	if audio_is_paused(music) {
		audio_resume_sound(music);
	}
}