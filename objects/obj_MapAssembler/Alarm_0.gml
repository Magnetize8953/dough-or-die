//if variable_instance_exists(BM.EastExit, "EastConnect") and variable_instance_exists(BR.WestExit, "WestConnect") {
	//BM.EastExit.EastConnect = BR.WestExit;
	
//}
//BR.WestExit.WestConnect = BM.EastExit;



//Accessing our rooms via global.room_object_map
var bm_east = ds_map_find_value(global.room_object_map, string(BM.EastExit));

show_debug_message("BM East Exit exists?: " + string(bm_east));

var br_west = ds_map_find_value(global.room_object_map, string(BR.WestExit));

show_debug_message("BR West Exit exists?: " + string(br_west));

if (instance_exists(bm_east)) {
	bm_east.EastConnect = BR.WestExit;
}

//ds_map_find_value(global.room_object_map, string(BR.WestExit)).WestConnect = BR.EastExit;
room_goto(BM.RoomList[0]);

