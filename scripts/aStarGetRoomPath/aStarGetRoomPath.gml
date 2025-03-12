function aStarGetRoomPath(startRoom, goalRoom) {
    if (startRoom == goalRoom) {
        show_debug_message("Already in goal room.");
        return [startRoom];
    }

    // A* Data Structures
    var G = ds_map_create();
    var H = ds_map_create();
    var F = ds_priority_create();
    var P = ds_map_create();
	// Closed list to store rooms we have completely explored
    var C = ds_list_create();

    ds_map_add(G, startRoom, 0);
    ds_priority_add(F, startRoom, 0);

    var found = false;
    var curRoom = startRoom;

    while (!ds_priority_empty(F)) {
		// removes and returns the room with the lowest F, so we never revist it
        curRoom = ds_priority_delete_min(F);

        if (curRoom == goalRoom) {
            found = true;
            break;
        }

        ds_list_add(C, curRoom);
		// Current cost of G is calculated
        var curG = ds_map_find_value(G, curRoom);

        // Get connected rooms
        var roomHolder = ds_map_find_value(global.room_object_map, curRoom);
		// get the cur rooms connections 
        var neighbors = [
            roomHolder.north_connect,
            roomHolder.south_connect,
            roomHolder.east_connect,
            roomHolder.west_connect
        ];

		// Exploring neighbor
        for (var i = 0; i < array_length(neighbors); i++) {
            var nextRoom = neighbors[i];
			// Make sure room exists and its not on the closed list before we evaluate
            if (nextRoom == noone || ds_list_find_index(C, nextRoom) != -1) {
                continue;
            }
			// computing G H and F costs
			// increase cost for each new room
            var tempG = curG + 1;
			// estimate H cost using manhattan D
			// NEXT STEP IS FIGURING OUT HOW TO ACTUALLY GET THESE X AND Y CORDS.
			
			var goalRoomName = room_get_name(goalRoom);
			var nextRoomName = room_get_name(nextRoom);

			var tempH = abs(room_get_x(goalRoomName) - room_get_x(nextRoomName)) + 
			            abs(room_get_y(goalRoomName) - room_get_y(nextRoomName));
						
			show_debug_message("heuristic between " + goalRoom +
				" and " + nextRoom + " = " + string(tempH));
				
            var tempF = tempG + tempH;
			// check if neighbor is better than existing path
            if (ds_map_exists(G, nextRoom)) {
                var existingG = ds_map_find_value(G, nextRoom);
				// is tempG is smaller replace vals for the better path
                if (tempG < existingG) {
                    ds_map_replace(G, nextRoom, tempG);
                    ds_map_replace(P, nextRoom, curRoom);
                    ds_priority_change_priority(F, nextRoom, tempF);
                }
			// if neighbor is not already visited, its vals are added 	
            } else {
                ds_map_add(G, nextRoom, tempG);
                ds_map_add(H, nextRoom, tempH);
                ds_map_add(P, nextRoom, curRoom);
                ds_priority_add(F, nextRoom, tempF);
            }
        }
    }
	
	// once path is found ie. F is empty, reconstruct path using P

    var path = [];

    if (found) {
        var step = goalRoom;
        while (step != startRoom) {
			// inserting new rooms from the parent list into the path until
			// we get all the way back to the start
			// inserting each new step (room) into the begining of the path list index 0
			// so when we reach end it will be in the correct order, preventing reversal
            array_insert(path, 0, step);
			// reset step to next past room
            step = ds_map_find_value(P, step);
        }
        array_insert(path, 0, startRoom);
    }

    // Cleanup all temp data structures to prevent memory leaks 
    ds_map_destroy(G);
    ds_map_destroy(H);
    ds_priority_destroy(F);
    ds_map_destroy(P);
    ds_list_destroy(C);

    return path;

}