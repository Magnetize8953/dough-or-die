if (map_done) {
    if (global.enemy1_should_respawn && room == global.enemy1_target_room) {
        global.enemy1_should_respawn = false;
        instance_create_layer(global.enemy1_respawn_x, global.enemy1_respawn_y, "Instances", obj_enemy);
        show_debug_message("Respawning Enemy 1 in " + room_get_name(room));
    }
    if (global.enemy2_should_respawn && room == global.enemy2_target_room) {
        global.enemy2_should_respawn = false;
        instance_create_layer(global.enemy2_respawn_x, global.enemy2_respawn_y, "Instances", obj_enemy2);
        show_debug_message("Respawning Enemy 2 in " + room_get_name(room));
    }
}