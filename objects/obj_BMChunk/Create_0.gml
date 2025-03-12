self.persistent = true;
//self.room_list = RoomList;
RoomList = [];


// Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
// Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = BMaRoom1;
	RoomList[1] = BMaRoom2;
	RoomList[2] = BMaRoom3;
	RoomList[3] = BMaRoom4;
	RoomList[4] = BMaRoom5;
	self.EastExit = BMaRoom1;
	self.NorthExit = BMaRoom5;
	self.WestExit = BMaRoom2;
	
	show_debug_message("BMChunk selected: A variant, first room = " + RoomList[0]);
	
} else {
	RoomList[0] = BMbRoom1;
	RoomList[1] = BMbRoom2;
	RoomList[2] = BMbRoom3;
	RoomList[3] = BMbRoom4;
	RoomList[4] = BMbRoom5;
	RoomList[5] = BMbRoom6;
	self.WestExit = BMbRoom3;
	self.EastExit = BMbRoom4;
	self.NorthExit = BMbRoom1;
	
	show_debug_message("BMChunk selected: B variant, first room = " + RoomList[0]);
}

