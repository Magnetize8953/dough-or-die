// Update doors in connections

// Hardcoding in the linking process for all 24 directionals between chunks
// May god help us all
// https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Variable_Functions/variable_global_exists.htm

// 1. TL<->TM
if variable_global_exists("tl_east") {
	if myself == global.tl_east {
		self.east_connect = global.TM.WestExit;
		self.east_result = "W";
	}
}
if variable_global_exists("tm_west") {
	if myself == global.tm_west {
		self.west_connect = global.TL.EastExit;
		self.west_result = "E";
	}
}

// 2. TM<->TR
if variable_global_exists("tm_east") {
	if myself == global.tm_east {
		self.east_connect = global.TR.WestExit;
		self.east_result = "W";
	}
}
if variable_global_exists("tr_west") {
	if myself == global.tr_west {
		self.west_connect = global.TM.EastExit;
		self.west_result = "E";
	}
}
// 3. ML<->C
if variable_global_exists("ml_east") {
	if myself == global.ml_east {
		self.east_connect = global.C.WestExit;
		self.east_result = "W";
	}
}
if variable_global_exists("c_west") {
	if myself == global.c_west {
		self.west_connect = global.ML.EastExit;
		self.west_result = "E";
	}
}

// 4. C<->MR
if variable_global_exists("c_east") {
	if myself == global.c_east {
		self.east_connect = global.MR.WestExit;
		self.east_result = "W";
	}
}
if variable_global_exists("mr_west") {
	if myself == global.mr_west {
		self.west_connect = global.C.EastExit;
		self.west_result = "E";
	}
}

// 5. BL<->BM
if variable_global_exists("bl_east") {
	if myself == global.bl_east {
		self.east_connect = global.BM.WestExit;
		self.east_result = "W";
	}
}
if variable_global_exists("bm_west") {
	if myself == global.bm_west {
		self.west_connect = global.BL.EastExit;
		self.west_result = "E";
	}
}

// 6. BM<->BR
if variable_global_exists("bm_east"){
	if myself == global.bm_east {
		self.east_connect = global.BR.WestExit;
		self.east_result = "W";
	}
}
if variable_global_exists("br_west") {
	if myself == global.br_west {
		self.west_connect = global.BM.EastExit;
		self.west_result = "E";
	}
}

// 7. TL<->ML
if variable_global_exists("tl_south"){
	if myself == global.tl_south {
		self.south_connect = global.ML.NorthExit;
		self.south_result = "N";
	}
}
if variable_global_exists("ml_north"){
	if myself == global.ml_north {
		self.north_connect = global.TL.SouthExit;
		self.north_result = "S";
	}
}

// 8. ML<->BL
if variable_global_exists("ml_south"){
	if myself == global.ml_south {
		self.south_connect = global.BL.NorthExit;
		self.south_result = "N";
	}
}
if variable_global_exists("bl_north"){
	if myself == global.bl_north {
		self.north_connect = global.ML.SouthExit;
		self.north_result = "S";
	}
}

// 9. TM<->C
if variable_global_exists("tm_south"){
	if myself == global.tm_south {
		self.south_connect = global.C.NorthExit;
		self.south_result = "N";
	}
}
if variable_global_exists("c_north"){ 
	if myself == global.c_north {
		self.north_connect = global.TM.SouthExit;
		self.north_result = "S";
	}
}

// 10. C<->BM
if variable_global_exists("c_south"){
	if myself == global.c_south {
		self.south_connect = global.BM.NorthExit;
		self.south_result = "N";
	}
}
if variable_global_exists("bm_north"){ 
	if myself == global.bm_north {
		self.north_connect = global.C.SouthExit;
		self.north_result = "S";
	}
}

// 11. TR<->MR
if variable_global_exists("tr_south"){
	if myself == global.tr_south {
		self.south_connect = global.MR.NorthExit;
		self.south_result = "N";
	}
}
if variable_global_exists("mr_north"){
	if myself == global.mr_north {
		self.north_connect = global.TR.SouthExit;
		self.north_result = "S";
	}
}

// 12. MR<->BR
if variable_global_exists("mr_south"){
	if myself == global.mr_south {
		self.south_connect = global.BR.NorthExit;
		self.south_result = "N";
	}
}
if variable_global_exists("br_north"){
	if myself == global.br_north {
		self.north_connect = global.MR.SouthExit;
		self.north_result = "S";
	}
}


// For the variant of center chunk with mini-puzzle for the heart of the maze, 
// Give it its exits to any direction for the chunk
if variable_global_exists("C") {
	if self.associated_room == CbRoomHeart {
		if variable_global_exists("TM") {
			self.north_connect = global.TM.SouthExit;
			self.north_result = "S";
		}
		if variable_global_exists("ML"){
			self.west_connect = global.ML.EastExit;
			self.west_result = "E";
		}
		if variable_global_exists("MR") {
			self.east_connect = global.MR.WestExit;
			self.east_result = "W";
		}
		if variable_global_exists("BM") {
			self.south_connect = global.BM.NorthExit;
			self.south_result = "N";
		}
	}
}

// Check to link in the Bases
if self.associated_room == Player1Base and variable_global_exists("ML") {
	self.east_connect = global.ML.RoomList[0];
	self.east_result = "W";
} else if self.associated_room == Player2Base and variable_global_exists("MR") {
	self.west_connect = global.MR.RoomList[0];
	self.west_result = "E";
}


// Check for the possibility of secret room in center of maze teleport functionality
if variable_global_exists("C") and (self.associated_room == CaRoomHeart or self.associated_room == CbRoomHeart) {
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
if keyboard_check(vk_alt) and keyboard_check_pressed(ord("R")) and variable_global_exists("cheat_code_room_name") {
	if !global.cheat_code_room_name {
		global.cheat_code_room_name = true;
	} else {
		global.cheat_code_room_name = false;
	}
}