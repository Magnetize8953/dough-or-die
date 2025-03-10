self.persistent = true;

// Random choice conditional produced with ChatGPT's assistance to debug random seed not resetting properly
// Remaining code and data structure is original work
randomize();
fifty_fifty = (irandom(1) == 1);
if (fifty_fifty) {
	RoomList[0] = CaRoom1;
	RoomList[1] = CaRoom2;
	RoomList[2] = CaRoom3;
	RoomList[3] = CaRoom4;
	RoomList[4] = CaRoom5;
	RoomList[5] = CaRoom6;
	RoomList[6] = CaRoom7;
	RoomList[7] = CaRoom8;
	RoomList[8] = CaRoom9;
	RoomList[9] = CaRoom10;
	RoomList[10] = CaRoom11;
	RoomList[11] = CaRoom12;
	RoomList[12] = CaRoom13;
	RoomList[13] = CaRoom14;
	RoomList[14] = CaRoom15;
	RoomList[15] = CaRoom16;
	RoomList[16] = CaRoomHeart;
	self.NorthExit = CaRoom1;
	self.SouthExit = CaRoom11;
	self.WestExit = CaRoom14;
	self.EastExit = CaRoom16;
	
} else {
	RoomList[0] = CbRoom1;
	RoomList[1] = CbRoom2;
	RoomList[2] = CbRoom3;
	RoomList[3] = CbRoom4;
	RoomList[4] = CbRoom5;
	RoomList[5] = CbRoom6;
	RoomList[6] = CbRoom7;
	RoomList[7] = CbRoom8;
	RoomList[8] = CbRoomHeart;
	self.SouthExit = CbRoom1;
	self.WestExit = CbRoom3;
	self.NorthExit = CbRoom6;
	self.EastExit = CbRoom7;
}

