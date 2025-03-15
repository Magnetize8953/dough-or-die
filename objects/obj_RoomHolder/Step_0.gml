// Update doors in connections

// Hardcoding in the linking process for all 24 directionals between chunks
// May god help us all

// 1. TL<->TM
if (global.tl_east != noone) {
	if (myself == global.tl_east) {
		self.east_connect = global.TM.WestExit;
		self.east_result = "W";
	}
}
if (global.tm_west != noone) {
	if (myself == global.tm_west) {
		self.west_connect = global.TL.EastExit;
		self.west_result = "E";
	}
}

// 2. TM<->TR
if (global.tm_east != noone) {
	if (myself == global.tm_east) {
		self.east_connect = global.TR.WestExit;
		self.east_result = "W";
	}
}
if (global.tr_west != noone) {
	if (myself == global.tr_west) {
		self.west_connect = global.TM.EastExit;
		self.west_result = "E";
	}
}
// 3. ML<->C
if (global.ml_east != noone) {
	if (myself == global.ml_east) {
		self.east_connect = global.C.WestExit;
		self.east_result = "W";
	}
}
if (global.c_west != noone) {
	if (myself == global.c_west) {
		self.west_connect = global.ML.EastExit;
		self.west_result = "E";
	}
}

// 4. C<->MR
if (global.c_east != noone) {
	if (myself == global.c_east) {
		self.east_connect = global.MR.WestExit;
		self.east_result = "W";
	}
}
if (global.mr_west != noone) {
	if (myself == global.mr_west) {
		self.west_connect = global.C.EastExit;
		self.west_result = "E";
	}
}

// 5. BL<->BM
if (global.bl_east != noone) {
	if (myself == global.bl_east) {
		self.east_connect = global.BM.WestExit;
		self.east_result = "W";
	}
}
if (global.bm_west != noone) {
	if (myself == global.bm_west) {
		self.west_connect = global.BL.EastExit;
		self.west_result = "E";
	}
}

// 6. BM<->BR
if (global.bm_east != noone){
	if (myself == global.bm_east) {
		self.east_connect = global.BR.WestExit;
		self.east_result = "W";
	}
}
if (global.br_west != noone) {
	if (myself == global.br_west) {
		self.west_connect = global.BM.EastExit;
		self.west_result = "E";
	}
}

// 7. TL<->ML
if (global.tl_south != noone) {
	if (myself == global.tl_south) {
		self.south_connect = global.ML.NorthExit;
		self.south_result = "N";
	}
}
if (global.ml_north != noone) {
	if (myself == global.ml_north) {
		self.north_connect = global.TL.SouthExit;
		self.north_result = "S";
	}
}

// 8. ML<->BL
if (global.ml_south != noone) {
	if (myself == global.ml_south) {
		self.south_connect = global.BL.NorthExit;
		self.south_result = "N";
	}
}
if (global.bl_north != noone) {
	if (myself == global.bl_north) {
		self.north_connect = global.ML.SouthExit;
		self.north_result = "S";
	}
}

// 9. TM<->C
if (global.tm_south != noone) {
	if (myself == global.tm_south) {
		self.south_connect = global.C.NorthExit;
		self.south_result = "N";
	}
}
if (global.c_north != noone) { 
	if (myself == global.c_north) {
		self.north_connect = global.TM.SouthExit;
		self.north_result = "S";
	}
}

// 10. C<->BM
if (global.c_south != noone) {
	if (myself == global.c_south) {
		self.south_connect = global.BM.NorthExit;
		self.south_result = "N";
	}
}
if (global.bm_north != noone) { 
	if (myself == global.bm_north) {
		self.north_connect = global.C.SouthExit;
		self.north_result = "S";
	}
}

// 11. TR<->MR
if (global.tr_south != noone) {
	if (myself == global.tr_south) {
		self.south_connect = global.MR.NorthExit;
		self.south_result = "N";
	}
}
if (global.mr_north != noone) {
	if (myself == global.mr_north) {
		self.north_connect = global.TR.SouthExit;
		self.north_result = "S";
	}
}

// 12. MR<->BR
if (global.mr_south != noone) {
	if (myself == global.mr_south) {
		self.south_connect = global.BR.NorthExit;
		self.south_result = "N";
	}
}
if (global.br_north != noone) {
	if (myself == global.br_north) {
		self.north_connect = global.MR.SouthExit;
		self.north_result = "S";
	}
}


// For the variant of center chunk with mini-puzzle for the heart of the maze, 
// Give it its exits to any direction for the chunk
if (global.C != noone) {
	if (self.associated_room == CbRoomHeart) {
		if (global.TM != noone) {
			self.north_connect = global.TM.SouthExit;
			self.north_result = "S";
		}
		if (global.ML != noone) {
			self.west_connect = global.ML.EastExit;
			self.west_result = "E";
		}
		if (global.MR != noone) {
			self.east_connect = global.MR.WestExit;
			self.east_result = "W";
		}
		if (global.BM != noone) {
			self.south_connect = global.BM.NorthExit;
			self.south_result = "N";
		}
	}
}

// Check to link in the Bases
if (self.associated_room == Player1Base and global.ML != noone) {
	self.east_connect = global.ML.RoomList[0];
	self.east_result = "W";
} else if (self.associated_room == Player2Base and global.MR != noone) {
	self.west_connect = global.MR.RoomList[0];
	self.west_result = "E";
}


// Check for the possibility of secret room in center of maze teleport functionality
if ((global.C != noone) and (self.associated_room == CaRoomHeart or self.associated_room == CbRoomHeart)) {
	self.north_connect = global.TM.SouthExit;
	self.north_result = "S";
	self.west_connect = global.ML.EastExit;
	self.west_result = "E";
	self.east_connect = global.MR.WestExit;
	self.east_result = "W";
	self.south_connect = global.BM.NorthExit;
	self.south_result = "N";
}

// Checks if the connection is not noone and there's no door there, OR if it has been updated
// Usage of position_meeting and instance_place provided by ChatGPT, logic is original
if (!position_meeting(1920 / 2, 10 + obj_Go2Room.sprite_yoffset, obj_Go2Room) and self.north_connect != noone) or (variable_instance_exists(self, "original_nc") and original_nc != self.north_connect) {
	instance_destroy(instance_place(1920 / 2, 10 + obj_Go2Room.sprite_yoffset, obj_Go2Room));
	instance_create_layer(1920 / 2, 10 + obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.north_connect, result : self.north_result});
} 
if (!position_meeting(1920 / 2, 1070 - obj_Go2Room.sprite_yoffset, obj_Go2Room) and self.south_connect != noone) or (variable_instance_exists(self, "original_sc") and original_sc != self.south_connect) {
	instance_destroy(instance_place(1920 / 2, 1070 - obj_Go2Room.sprite_yoffset, obj_Go2Room));
	instance_create_layer(1920 / 2, 1070 - obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.south_connect, result : self.south_result});
}
if (!position_meeting(10 + obj_Go2Room.sprite_xoffset, 1080 / 2, obj_Go2Room) and self.west_connect != noone) or (variable_instance_exists(self, "original_wc") and original_wc != self.west_connect) {
	instance_destroy(instance_place(10 + obj_Go2Room.sprite_xoffset, 1080 / 2, obj_Go2Room));
	instance_create_layer(10 + obj_Go2Room.sprite_xoffset, 1080 / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.west_connect, result : self.west_result});
}
if (!position_meeting(1910 - obj_Go2Room.sprite_xoffset, 1080 / 2, obj_Go2Room) and self.east_connect != noone) or (variable_instance_exists(self, "original_ec") and original_ec != self.east_connect) {
	instance_destroy(instance_place(1910 - obj_Go2Room.sprite_xoffset, 1080 / 2, obj_Go2Room));
	instance_create_layer(1910 - obj_Go2Room.sprite_xoffset, 1080 / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.east_connect, result : self.east_result});
}


// Cheat code - draws room name if cheat code is entered; toggles on/off with alt+R
if ((keyboard_check(vk_alt) and keyboard_check_pressed(ord("R"))) and (global.cheat_code_room_name != noone)) {
	if !global.cheat_code_room_name {
		global.cheat_code_room_name = true;
	} else {
		global.cheat_code_room_name = false;
	}
}
