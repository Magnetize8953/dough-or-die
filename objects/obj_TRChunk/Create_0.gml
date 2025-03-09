self.persistent = true;

//Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
//Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = TRaRoom1;
	RoomList[1] = TRaRoom2;
	RoomList[2] = TRaRoom3;
	RoomList[3] = TRaRoom4;
	RoomList[4] = TRaRoom5;
	RoomList[5] = TRaRoom6;
	self.SouthExit = TRaRoom1;
	self.WestExit = TRaRoom5;
	
} else {
	RoomList[0] = TRbRoom1;
	RoomList[1] = TRbRoom2;
	RoomList[2] = TRbRoom3;
	RoomList[3] = TRbRoom4;
	RoomList[4] = TRbRoom5;
	self.SouthExit = TRbRoom1;
	self.WestExit = TRbRoom5;
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

