self.persistent = true;

// Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
// Remaining code and data structure is original work
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
	
	
	show_debug_message("TRChunk selected: A variant, first room = " + RoomList[0]);
	
} else {
	RoomList[0] = TRbRoom1;
	RoomList[1] = TRbRoom2;
	RoomList[2] = TRbRoom3;
	RoomList[3] = TRbRoom4;
	RoomList[4] = TRbRoom5;
	self.SouthExit = TRbRoom1;
	self.WestExit = TRbRoom5;
	
	
	show_debug_message("TRChunk selected: B variant, first room = " + RoomList[0]);
}

