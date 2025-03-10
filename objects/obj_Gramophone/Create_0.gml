// Citation: https://www.youtube.com/watch?v=ni6L1sDCl5E

// set audio player's info of where the player is
audio_listener_orientation(0, 0, 1, 0, -1, 0);
audio_listener_position(obj_Player.x, obj_Player.y, 0);

// set up the playing/emitting of sound
emitter = audio_emitter_create();
audio_falloff_set_model(audio_falloff_inverse_distance_scaled);
audio_emitter_falloff(emitter, 100, 1825, 1);

// play sound
music = audio_play_sound_on(emitter, snd_OperaTrack, true, 10);
audio_emitter_position(emitter, x, y, 0);