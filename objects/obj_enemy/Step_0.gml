var target;

if (instance_exists(obj_Player)) {
    target = instance_nearest(x, y, obj_Player);

    if (target != noone) {
        if (distance_to_object(target) <= attack_range) {
            path_end();
            direction = point_direction(x, y, target.x, target.y);
            speed = hsp;
        }
    }
}

if (!instance_exists(target)) {
    path_start(enemy, speed, path_action_stop, false);
}

if (map_done) {
    if (a_option) {
        if (room == global.BM.RoomList[0] || 
            room == global.BM.RoomList[1] || 
            room == global.BM.RoomList[2] || 
            room == global.BM.RoomList[3] || 
            room == global.BM.RoomList[4]) {
            
            if (!persistent) {
                show_debug_message("Setting persistent = true (In MLA room)");
            }
            persistent = true;

        } else {
            if (persistent) {
                show_debug_message("Setting persistent = false (Not in MLA room)");
            }
            persistent = false;

            global.enemy_target_room = BMaRoom1;
            global.enemy_respawn_x = x;
            global.enemy_respawn_y = y;
            global.enemy_should_respawn = true;

            show_debug_message("Enemy removed, will respawn in " + room_get_name(global.enemy_target_room));

            instance_destroy();
        }
    }

    if (b_option) {
        if (room == global.BM.RoomList[0] || 
            room == global.BM.RoomList[1] || 
            room == global.BM.RoomList[2] || 
            room == global.BM.RoomList[3] ||
			room == global.BM.RoomList[4] ||
			room == global.BM.RoomList[5]) {
            
            if (!persistent) {
                show_debug_message("Setting persistent = true (In MLB room)");
            }
            persistent = true;

        } else {
            if (persistent) {
                show_debug_message("Setting persistent = false (Not in MLB room)");
            }
            persistent = false;

            global.enemy_target_room = BMaRoom1;
            global.enemy_respawn_x = x;
            global.enemy_respawn_y = y;
            global.enemy_should_respawn = true;

            show_debug_message("Enemy removed, will respawn in " + room_get_name(global.enemy_target_room));

            instance_destroy();
        }
    }
}