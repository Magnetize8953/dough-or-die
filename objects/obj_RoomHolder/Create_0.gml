// Modified off code provided via ChatGPT
// Essentially, we map each RoomHolder via the room its in, so that we can then retrieve them by room name

self.roomx = x;
self.roomy = y;

if (!variable_global_exists("room_object_map")) {
    global.room_object_map = ds_map_create();
	show_debug_message("Map made");
}
if (variable_instance_exists(self, "associated_room") && is_real(self.associated_room)) {
	ds_map_set(global.room_object_map, room_get_name(self.associated_room), self.id); // Store instance by room name
	show_debug_message("ASSOCIATED ROOM BEING MAPPED IN: " + room_get_name(self.associated_room));
	show_debug_message("Map?: " + string(ds_map_find_value(global.room_object_map, room_get_name(self.associated_room))));
} else {
	show_debug_message("Error: associated_room is not set for RoomHolder instance: " + string(self.id));
}

if self.north_connect != noone {
	instance_create_layer(1920 / 2, 10 + obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.north_connect, result : self.north_result});
	original_nc = self.north_connect; // used to check for updates
}
if self.south_connect != noone {
	instance_create_layer(1920 / 2, 1070 - obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.south_connect, result : self.south_result});
	original_sc = self.south_connect;
}
if self.west_connect != noone {
	instance_create_layer(10 + obj_Go2Room.sprite_xoffset, 1080 / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.west_connect, result : self.west_result});
	original_wc = self.west_connect;
}
if self.east_connect != noone {
	instance_create_layer(1910 - obj_Go2Room.sprite_xoffset, 1080 / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.east_connect, result : self.east_result});
	original_ec = self.east_connect;
}

myself = ds_map_find_value(global.room_object_map, room_get_name(self.associated_room));

is_bm_east_check = true;