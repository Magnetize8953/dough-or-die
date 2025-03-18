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
}