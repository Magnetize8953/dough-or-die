event_inherited();

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
}