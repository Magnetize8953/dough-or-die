if(map_done){
	if (global.enemy_should_respawn && room == global.enemy_target_room) {
	    global.enemy_should_respawn = false;
	    instance_create_layer(global.enemy_respawn_x, global.enemy_respawn_y, "Instances", obj_enemy);
	    show_debug_message("Respawning enemy in " + room_get_name(room) + " at (" + string(global.enemy_respawn_x) + ", " + string(global.enemy_respawn_y) + ")");
	}
}
