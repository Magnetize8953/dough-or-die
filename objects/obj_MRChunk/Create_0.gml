event_inherited();

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
	
} else {
	RoomList[0] = MRbRoom1;
	RoomList[1] = MRbRoom2;
	RoomList[2] = MRbRoom3;
	RoomList[3] = MRbRoom4;
	RoomList[4] = MRbRoom5;
	self.SouthExit = MRbRoom2;
	self.NorthExit = MRbRoom4;
	self.WestExit = MRbRoom4;
}