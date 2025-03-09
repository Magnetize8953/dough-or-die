self.persistent = true;

// Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
// Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = TLaRoom1;
	RoomList[1] = TLaRoom2;
	RoomList[2] = TLaRoom3;
	RoomList[3] = TLaRoom4;
	RoomList[4] = TLaRoom5;
	self.SouthExit = TLaRoom1;
	self.EastExit = TLaRoom1;
	
} else {
	RoomList[0] = TLbRoom1;
	RoomList[1] = TLbRoom2;
	RoomList[2] = TLbRoom3;
	RoomList[3] = TLbRoom4;
	RoomList[4] = TLbRoom5;
	self.SouthExit = TLbRoom1;
	self.EastExit = TLbRoom5;
}

