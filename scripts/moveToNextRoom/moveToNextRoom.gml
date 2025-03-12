function moveToNextRoom(){
	// check theres a room to move to 
	if (global.roomIndex < array_length(global.roomPath)) {
		// get next room from the path
        var nextRoom = global.roomPath[global.roomIndex];
		// keep track of progress in path 
        global.roomIndex++;
        room_goto(nextRoom);
    } else {
        show_debug_message("Reached goal room.");
    }
}