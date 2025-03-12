self.persistent = true;

// Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
// Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = TMaRoom1;
	RoomList[1] = TMaRoom2;
	RoomList[2] = TMaRoom3;
	RoomList[3] = TMaRoom4;
	RoomList[4] = TMaRoom5;
	self.WestExit = TMaRoom1;
	self.EastExit = TMaRoom5;
	self.SouthExit = TMaRoom5;
	
	
	show_debug_message("TMChunk selected: A variant, first room = " + RoomList[0]);
	
} else {
	RoomList[0] = TMbRoom1;
	RoomList[1] = TMbRoom2;
	RoomList[2] = TMbRoom3;
	RoomList[3] = TMbRoom4;
	RoomList[4] = TMbRoom5;
	RoomList[5] = TMbRoom6;
	RoomList[6] = TMbRoom7;
	self.WestExit = TMbRoom1;
	self.EastExit = TMbRoom3;
	self.SouthExit = TMbRoom5;
	
	
	show_debug_message("TMChunk selected: B variant, first room = " + RoomList[0]);
}

