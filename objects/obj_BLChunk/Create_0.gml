event_inherited();

if (fifty_fifty) {
	RoomList[0] = BLaRoom1;
	RoomList[1] = BLaRoom2;
	RoomList[2] = BLaRoom3;
	RoomList[3] = BLaRoom4;
	RoomList[4] = BLaRoom5;
	RoomList[5] = BLaRoom6;
	self.EastExit = BLaRoom4;
	self.NorthExit = BLaRoom1;

} else {
	RoomList[0] = BLbRoom1;
	RoomList[1] = BLbRoom2;
	RoomList[2] = BLbRoom3;
	RoomList[3] = BLbRoom4;
	RoomList[4] = BLbRoom5;
	self.EastExit = BLbRoom2;
	self.NorthExit = BLbRoom1;
}