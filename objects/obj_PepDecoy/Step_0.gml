if self.health <= 0 {
	instance_destroy();
}

if !on_path {
	dist_list[0] = y - 220;  // distance to north edge of path
	dist_list[1] = x - 220;  // distance to west
	dist_list[2] = room_width - 220 - x; // distance to east
	dist_list[3] = room_height - 220 - y;  // distance to south
    
	// https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Variable_Functions/array_sort.htm
	// sorts the array to have the lowest value first
	array_sort(dist_list, true);
    
	if dist_list[0] == y - 220 { // if lowest distance is to north
		y -= 10;
		if y <= 220 {
			y = 220;
			on_path = true;
			direct = "east";
		}
	} else if dist_list[1] == x - 220 { // ... to west
		x -= 10;
		if x <= 220 {
			x = 220;
			on_path = true;
			direct = "north";
		}
	} else if dist_list[2] == room_width - 220 - x { // ... to east
		x += 10;
		if x >= room_width - 220 {
			x = room_width - 220;
			on_path = true;
			direct = "south";
		}
	} else { // ... to south 
		y += 10;
		if y >= room_height - 220 {
			y = room_height - 220;
			on_path = true;
			direct = "west";
		}
	}
} else { // If it is on path
	if direct == "east" { // travel east along north side
		x += 10;
		if x >= room_width - 220 { direct = "south"} // switch to south
		
	} if direct == "south" { // travel south along east side
		y += 10;
		if y >= room_height - 220 { direct = "west" } // switch to west
		
	}  if direct == "west" { // travel west along south side
		x -= 10;
		if x <= 220 { direct = "north"} // switch to north
		
	}  if direct == "north" { // travel north along west side
		y -= 10;
		if y <= 220 { direct = "east" } // switch to east 
		
	}
}