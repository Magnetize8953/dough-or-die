event_inherited();

if (fifty_fifty) {
	RoomList[0] = BMaRoom1;
	RoomList[1] = BMaRoom2;
	RoomList[2] = BMaRoom3;
	RoomList[3] = BMaRoom4;
	RoomList[4] = BMaRoom5;
	self.EastExit = BMaRoom1;
	self.NorthExit = BMaRoom5;
	self.WestExit = BMaRoom2;
	
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
}