self.persistent = true;
//self.room_list = RoomList;
RoomList = [];


//Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
//Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = MRaRoom1;
	RoomList[1] = MRaRoom2;
	RoomList[2] = MRaRoom3;
	RoomList[3] = MRaRoom4;
	RoomList[4] = MRaRoom5;
	RoomList[5] = MRaRoom6;
	self.WestExit = MRaRoom3;
	self.SouthExit = MRaRoom4;
	self.NorthExit = MRaRoom4;
	
	show_debug_message("MRChunk selected: A variant, first room = " + RoomList[0]);
	
} else {
	RoomList[0] = MRbRoom1;
	RoomList[1] = MRbRoom2;
	RoomList[2] = MRbRoom3;
	RoomList[3] = MRbRoom4;
	RoomList[4] = MRbRoom5;
	self.SouthExit = MRbRoom2;
	self.NorthExit = MRbRoom4;
	self.WestExit = MRbRoom4;
	
	show_debug_message("MRChunk selected: B variant, first room = " + RoomList[0]);
	/*
	for (i = 0; i < 8; i++){
		 //Non-existence check written with help of ChatGPT
		if (RoomList[i] != noone and variable_instance_exists(RoomList[i], "WestConnect")) {
			if (RoomList[i].WestConnect != noone and RoomList[i].WestConnect == ExitChunk) {
				self.WestExit = RoomList[i];
			}
		}
		//Non-existence check written with help of ChatGPT
		if (RoomList[i] != noone and variable_instance_exists(RoomList[i], "NorthConnect")) {
			if (RoomList[i] != noone and RoomList[i].NorthConnect != noone and RoomList[i].NorthConnect == ExitChunk) {
				self.NorthExit = RoomList[i];
			}
		}
	}
	*/
}
//room_goto(WestExit);

