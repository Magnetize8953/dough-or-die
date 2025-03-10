// update audio player's info of where the player is
audio_listener_position(obj_Player.x, obj_Player.y, 0);

// If music already exists, unpause it
if audio_is_paused(music) {
	audio_resume_sound(music);
}