/// show_debug_message("Is room mapped: " + string(ds_map_find_value(global.room_object_map, room_get_name(BRaRoom1))));

global.TL = instance_create_layer(0, -10, "Instances", obj_TLChunk);
global.tl_east = ds_map_find_value(global.room_object_map, room_get_name(global.TL.EastExit));
global.tl_south = ds_map_find_value(global.room_object_map, room_get_name(global.TL.SouthExit));

global.TM = instance_create_layer(5, -10, "Instances", obj_TMChunk);
global.tm_west = ds_map_find_value(global.room_object_map, room_get_name(global.TM.WestExit));
global.tm_east = ds_map_find_value(global.room_object_map, room_get_name(global.TM.EastExit));
global.tm_south = ds_map_find_value(global.room_object_map, room_get_name(global.TM.SouthExit));

global.TR = instance_create_layer(10, -10, "Instances", obj_TRChunk);
global.tr_west = ds_map_find_value(global.room_object_map, room_get_name(global.TR.WestExit));
global.tr_south = ds_map_find_value(global.room_object_map, room_get_name(global.TR.SouthExit));

global.ML = instance_create_layer(15, -10, "Instances", obj_MLChunk);
global.ml_north = ds_map_find_value(global.room_object_map, room_get_name(global.ML.NorthExit));
global.ml_east = ds_map_find_value(global.room_object_map, room_get_name(global.ML.EastExit));
global.ml_south = ds_map_find_value(global.room_object_map, room_get_name(global.ML.SouthExit));

global.C = instance_create_layer(20, -10, "Instances", obj_CChunk);
global.c_north = ds_map_find_value(global.room_object_map, room_get_name(global.C.NorthExit));
global.c_west = ds_map_find_value(global.room_object_map, room_get_name(global.C.WestExit));
global.c_east = ds_map_find_value(global.room_object_map, room_get_name(global.C.EastExit));
global.c_south = ds_map_find_value(global.room_object_map, room_get_name(global.C.SouthExit));

global.MR = instance_create_layer(25, -10, "Instances", obj_MRChunk);
global.mr_north = ds_map_find_value(global.room_object_map, room_get_name(global.MR.NorthExit));
global.mr_west = ds_map_find_value(global.room_object_map, room_get_name(global.MR.WestExit));
global.mr_south = ds_map_find_value(global.room_object_map, room_get_name(global.MR.SouthExit));

global.BL = instance_create_layer(30, -10, "Instances", obj_BLChunk);
global.bl_north = ds_map_find_value(global.room_object_map, room_get_name(global.BL.NorthExit));
global.bl_east = ds_map_find_value(global.room_object_map, room_get_name(global.BL.EastExit));

global.BM = instance_create_layer(35, -10, "Instances", obj_BMChunk);
global.bm_north = ds_map_find_value(global.room_object_map, room_get_name(global.BM.NorthExit));
global.bm_west = ds_map_find_value(global.room_object_map, room_get_name(global.BM.WestExit));
global.bm_east = ds_map_find_value(global.room_object_map, room_get_name(global.BM.EastExit));

global.BR = instance_create_layer(40, -10, "Instances", obj_BRChunk);
global.br_north = ds_map_find_value(global.room_object_map, room_get_name(global.BR.NorthExit));
global.br_west = ds_map_find_value(global.room_object_map, room_get_name(global.BR.WestExit));


room_goto(Player1Base);
//room_goto(BRbRoom7);

global.map_generated = true;

instance_create_layer(500, 400, "Instances", obj_Player);
