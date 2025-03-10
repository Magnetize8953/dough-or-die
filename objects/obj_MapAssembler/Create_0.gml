global.map_generated = false;

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