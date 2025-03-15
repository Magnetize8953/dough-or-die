/// show_debug_message("Is room mapped: " + string(ds_map_find_value(global.room_object_map, room_get_name(BRaRoom1))));

if (!instance_exists(obj_Client)) { // server or solo
    
    global.TL = instance_create_layer(0, -10,  "Instances", obj_TLChunk);
    global.TM = instance_create_layer(5, -10,  "Instances", obj_TMChunk);
    global.TR = instance_create_layer(10, -10, "Instances", obj_TRChunk);
    global.ML = instance_create_layer(15, -10, "Instances", obj_MLChunk);
    global.C  = instance_create_layer(20, -10, "Instances", obj_CChunk);
    global.MR = instance_create_layer(25, -10, "Instances", obj_MRChunk);
    global.BL = instance_create_layer(30, -10, "Instances", obj_BLChunk);
    global.BM = instance_create_layer(35, -10, "Instances", obj_BMChunk);
    global.BR = instance_create_layer(40, -10, "Instances", obj_BRChunk);
    
} else { // joining server
    
    // preset is a boolean for if the chunk is the A version
    global.TL = instance_create_layer(0, -10,  "Instances", obj_TLChunk, { preset : obj_Client.server_rooms[? "TL"] });
    global.TM = instance_create_layer(5, -10,  "Instances", obj_TMChunk, { preset : obj_Client.server_rooms[? "TM"] });
    global.TR = instance_create_layer(10, -10, "Instances", obj_TRChunk, { preset : obj_Client.server_rooms[? "TR"] });
    global.ML = instance_create_layer(15, -10, "Instances", obj_MLChunk, { preset : obj_Client.server_rooms[? "ML"] });
    global.C  = instance_create_layer(20, -10, "Instances", obj_CChunk,  { preset : obj_Client.server_rooms[? "C"] });
    global.MR = instance_create_layer(25, -10, "Instances", obj_MRChunk, { preset : obj_Client.server_rooms[? "MR"] });
    global.BL = instance_create_layer(30, -10, "Instances", obj_BLChunk, { preset : obj_Client.server_rooms[? "BL"] });
    global.BM = instance_create_layer(35, -10, "Instances", obj_BMChunk, { preset : obj_Client.server_rooms[? "BM"] });
    global.BR = instance_create_layer(40, -10, "Instances", obj_BRChunk, { preset : obj_Client.server_rooms[? "BR"] });
    
}

#region chunk exits
global.tl_east = ds_map_find_value(global.room_object_map, room_get_name(global.TL.EastExit));
global.tl_south = ds_map_find_value(global.room_object_map, room_get_name(global.TL.SouthExit));

global.tm_west = ds_map_find_value(global.room_object_map, room_get_name(global.TM.WestExit));
global.tm_east = ds_map_find_value(global.room_object_map, room_get_name(global.TM.EastExit));
global.tm_south = ds_map_find_value(global.room_object_map, room_get_name(global.TM.SouthExit));

global.tr_west = ds_map_find_value(global.room_object_map, room_get_name(global.TR.WestExit));
global.tr_south = ds_map_find_value(global.room_object_map, room_get_name(global.TR.SouthExit));

global.ml_north = ds_map_find_value(global.room_object_map, room_get_name(global.ML.NorthExit));
global.ml_east = ds_map_find_value(global.room_object_map, room_get_name(global.ML.EastExit));
global.ml_south = ds_map_find_value(global.room_object_map, room_get_name(global.ML.SouthExit));

global.c_north = ds_map_find_value(global.room_object_map, room_get_name(global.C.NorthExit));
global.c_west = ds_map_find_value(global.room_object_map, room_get_name(global.C.WestExit));
global.c_east = ds_map_find_value(global.room_object_map, room_get_name(global.C.EastExit));
global.c_south = ds_map_find_value(global.room_object_map, room_get_name(global.C.SouthExit));

global.mr_north = ds_map_find_value(global.room_object_map, room_get_name(global.MR.NorthExit));
global.mr_west = ds_map_find_value(global.room_object_map, room_get_name(global.MR.WestExit));
global.mr_south = ds_map_find_value(global.room_object_map, room_get_name(global.MR.SouthExit));

global.bl_north = ds_map_find_value(global.room_object_map, room_get_name(global.BL.NorthExit));
global.bl_east = ds_map_find_value(global.room_object_map, room_get_name(global.BL.EastExit));

global.bm_north = ds_map_find_value(global.room_object_map, room_get_name(global.BM.NorthExit));
global.bm_west = ds_map_find_value(global.room_object_map, room_get_name(global.BM.WestExit));
global.bm_east = ds_map_find_value(global.room_object_map, room_get_name(global.BM.EastExit));

global.br_north = ds_map_find_value(global.room_object_map, room_get_name(global.BR.NorthExit));
global.br_west = ds_map_find_value(global.room_object_map, room_get_name(global.BR.WestExit));
#endregion

if (!instance_exists(obj_Client)) {
    room_goto(Player1Base);
} else {
    room_goto(Player2Base);
}

global.map_generated = true;

instance_create_layer(500, 400, "Instances", obj_Player);
