//persistent = true;

//Code moved to alarm event with guidance of ChatGPT; algorithm and code themselves are original

//room_goto(AssociatedRoom);


if self.NorthConnect != noone {
	instance_create_layer(1920 / 2, 0 + obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.NorthConnect, result : self.NorthResult});
	original_nc = self.NorthConnect; //used to check for updates
}
if self.SouthConnect != noone {
	instance_create_layer(1920 / 2, 1080 - obj_Go2Room.sprite_yoffset, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.SouthConnect, result : self.SouthResult});
	original_sc = self.SouthConnect;
}
if self.WestConnect != noone {
	instance_create_layer(0 + obj_Go2Room.sprite_xoffset, 1080 / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.WestConnect, result : self.WestResult});
	original_wc = self.WestConnect;
}
if self.EastConnect != noone {
	instance_create_layer(1920 - obj_Go2Room.sprite_xoffset, 1080 / 2, "Instances", obj_Go2Room, {associated_room_hold : self, room_link : self.EastConnect, result : self.EastResult});
	original_ec = self.EastConnect;
}


//Produced with assistance of ChatGPT
//Due to RoomHolders being persistent, it prevents Create from organically running
/*
if (!instance_exists(RoomHolder)) {
    instance_create_layer(x, y, "Instances", RoomHolder);
}
*/
