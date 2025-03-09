/*
//Modified off code provided via ChatGPT
//Essentially, we map each RoomHolder via the room its in, so that we can then retrieve them by room name
if (!variable_global_exists("room_object_map")) {
    global.room_object_map = ds_map_create();
	show_debug_message("Map made");
}

ds_map_set(global.room_object_map, string(room), id); // Store instance by room name
show_debug_message("Map?: " + string(ds_map_find_value(global.room_object_map, string(room))));
*/