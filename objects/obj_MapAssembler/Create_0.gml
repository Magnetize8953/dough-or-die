global.map_generated = false;

draw_set_font(fnt_mini);

// Used to hold a cheat code for show the room names
global.cheat_code_room_name = false;

// Iterate through every room to initialize all room holders
// Made in assistance with ChatGPT for how to iterate through rooms
// Logic is partially original work, partially that of ChatGPT (transforming for loop into Alarm loop)
// https://forum.gamemaker.io/index.php?threads/room-count.51625/

room_i = 0; 

room_holder = room;

if (room_exists(room_holder)) {
	room_goto(room_holder);
	alarm[1] = 10;
}

// decrease volume of menu music to nothing over the course of five seconds
audio_sound_gain(global.background_music, 0, 5000)