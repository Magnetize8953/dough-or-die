self.persistent = true;

// Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
// Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = BRaRoom1;
	RoomList[1] = BRaRoom2;
	RoomList[2] = BRaRoom3;
	RoomList[3] = BRaRoom4;
	RoomList[4] = BRaRoom5;
	self.WestExit = BRaRoom5;
	self.NorthExit = BRaRoom1;
	
} else {
	RoomList[0] = BRbRoom1;
	RoomList[1] = BRbRoom2;
	RoomList[2] = BRbRoom3;
	RoomList[3] = BRbRoom4;
	RoomList[4] = BRbRoom5;
	RoomList[5] = BRbRoom6;
	RoomList[6] = BRbRoom7;
	RoomList[7] = BRbRoom8;
	self.WestExit = BRbRoom8;
	self.NorthExit = BRbRoom1;
}

