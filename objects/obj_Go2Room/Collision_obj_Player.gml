//Moves to room door is connected to

room_goto(room_link);

//Jumps the player to existing at whatever entrance the previous one
//sends them to (i.e., going through a North door in one room that 
//leads to the West entrance teleports them to being beside the West
//Door in the new room

if (self.result == "N") {
	other.x = 1920 / 2;
	other.y = 210;
} else if (self.result == "W") {
	other.x = 210;
	other.y = 1080 / 2;
} else if (self.result == "E") {
	other.x = 1920 - 210;
	other.y = 1080 / 2;
} else if (self.result == "S") {
	other.x = 1920 / 2;
	other.y = 1080 - 210;
} else {
	//Catch in case something is wrong
	other.x = 1920 / 2;
	other.y = 1080 / 2;
}