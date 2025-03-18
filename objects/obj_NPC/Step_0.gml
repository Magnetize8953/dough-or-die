if(map_done){	
	if (instance_exists(obj_Player) &&
		room == global.ML.RoomList[0] || 
	    room == global.ML.RoomList[1] || 
	    room == global.ML.RoomList[2] || 
	    room == global.ML.RoomList[3]) {
		far = true;
		close = false;
		
	}
	if(
		room == global.MR.RoomList[0] || 
	    room == global.MR.RoomList[1] || 
	    room == global.MR.RoomList[2] || 
	    room == global.MR.RoomList[3] ||
		room == global.MR.RoomList[4]){
		close = true;
		far = false;
			
	}
	var other_player = instance_find(obj_OtherPlayer, 0);

	if (instance_exists(other_player)) {
	    if (other_player.room == global.MR.RoomList[0] ||
	        other_player.room == global.MR.RoomList[1] ||
	        other_player.room == global.MR.RoomList[2] ||
	        other_player.room == global.MR.RoomList[3] ||
	        other_player.room == global.MR.RoomList[4]) {
	        enemy_far = true;
	        enemy_close = false;
	    } else {
	        enemy_far = false;
	        enemy_close = true;
	    }
	} else {
	    enemy_far = false;
	    enemy_close = false;
	}
}