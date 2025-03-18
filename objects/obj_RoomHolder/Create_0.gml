// Modified off code provided via ChatGPT
// Essentially, we map each RoomHolder via the room its in, so that we can then retrieve them by room name
if (!variable_global_exists("room_object_map")) {
    global.room_object_map = ds_map_create();
	show_debug_message("Map made");
}

ds_map_set(global.room_object_map, room_get_name(self.associated_room), self.id); // Store instance by room name
show_debug_message("ASSOCIATED ROOM BEING MAPPED IN: " + room_get_name(self.associated_room));
show_debug_message("Map?: " + string(ds_map_find_value(global.room_object_map, room_get_name(self.associated_room))));

// Pick which door sprite is used by random
randomize();
door = irandom_range(0, 5);


if self.north_connect != noone {
	instance_create_layer(room_width / 2, 10 + obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.north_connect, result : self.north_result, sprite_num : door, image_angle : 0});
	original_nc = self.north_connect; // used to check for updates
} else { // Places a barrier if there is no door there
	instance_create_layer(room_width / 2 - 60, 0, "Instances", obj_Barrier);
}
if self.south_connect != noone {
	instance_create_layer(room_width / 2, room_height - 10 - obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.south_connect, result : self.south_result, sprite_num : door, image_angle : 180});
	original_sc = self.south_connect;
} else { 
	instance_create_layer(room_width / 2 - 60, room_height - 120, "Instances", obj_Barrier);
}
if self.west_connect != noone {
	instance_create_layer(10 + obj_Go2Room.sprite_xoffset, room_height / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.west_connect, result : self.west_result, sprite_num : door, image_angle : 90});
	original_wc = self.west_connect;
} else if self.associated_room != Player2Base {
	instance_create_layer(0, room_height / 2 - 60, "Instances", obj_Barrier);
} 
if self.east_connect != noone {
	instance_create_layer(room_width - 10 - obj_Go2Room.sprite_xoffset, room_height / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.east_connect, result : self.east_result, sprite_num : door, image_angle : 270});
	original_ec = self.east_connect;
} else if self.associated_room != Player1Base {
	instance_create_layer(room_width - 120, room_height / 2 - 60, "Instances", obj_Barrier);
}

myself = ds_map_find_value(global.room_object_map, room_get_name(self.associated_room));

is_bm_east_check = true;

if self.associated_room != Player1Base and self.associated_room != Player2Base and self.associated_room != CaRoomHeart and self.associated_room != CbRoomHeart and !instance_exists(obj_KillYou) {
	instance_create_layer(400, 400, "Instances", obj_Spawner);
}


// set up shader
layer_shader("Tiles_1", shdr_WallShader);
_uniColours = shader_get_uniform(shdr_WallShader, "u_rgb"); // setting up variable in shader
_colours = [ red, green, blue ]; // rgb are instance variables
