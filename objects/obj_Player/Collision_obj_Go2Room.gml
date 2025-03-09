// For doors that go in the same side it comes out (like east -> east),
// Disable moving in that direction long enough for player to react

if (other.result == "N") {
	alarm[0] = 27;
	self.disable_north = true;
} else if (other.result == "W") {
	alarm[0] = 27;
	self.disable_west = true;
} else if (other.result == "E") {
	alarm[0] = 27;
	self.disable_east = true;
} else if (other.result == "S") {
	alarm[0] = 27;
	self.disable_south = true;
}