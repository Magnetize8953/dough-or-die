self.persistent = true;

//Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
//Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = MLaRoom1;
	RoomList[1] = MLaRoom2;
	RoomList[2] = MLaRoom3;
	RoomList[3] = MLaRoom4;
	RoomList[4] = MLaRoom5;
	self.SouthExit = MLaRoom1;
	self.EastExit = MLaRoom4;
	self.NorthExit = MLaRoom5;
	
} else {
	RoomList[0] = MLbRoom1;
	RoomList[1] = MLbRoom2;
	RoomList[2] = MLbRoom3;
	RoomList[3] = MLbRoom4;
	self.NorthExit = MLbRoom3;
	self.SouthExit = MLbRoom3;
	self.EastExit = MLbRoom4;
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

