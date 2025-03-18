// As the room ends, pause music 
if audio_is_playing(music) {
	audio_pause_sound(music);
    
    // resume background music
    audio_resume_sound(global.background_music);
    audio_sound_gain(global.background_music, 1, pausing_speed);
}