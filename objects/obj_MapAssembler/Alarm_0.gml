// Accessing our rooms via global.room_object_map
var bm_east = ds_map_find_value(global.room_object_map, string(BM.EastExit));

show_debug_message("BM East Exit exists?: " + string(bm_east));

var br_west = ds_map_find_value(global.room_object_map, string(BR.WestExit));

show_debug_message("BR West Exit exists?: " + string(br_west));

if (instance_exists(bm_east)) {
	bm_east.EastConnect = BR.WestExit;
}

room_goto(BM.RoomList[0]);