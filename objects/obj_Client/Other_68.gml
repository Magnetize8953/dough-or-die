var event_id = async_load[? "id"];

if (event_id == client_socket && event_id != 1) {
    
    var connection_buffer = async_load[? "buffer"];
    buffer_seek(connection_buffer, buffer_seek_start, 1);
    var identifier = buffer_read(connection_buffer, buffer_u8);
    show_debug_message("client received: " + string(identifier));
    
    if (identifier == NETWORK.MAP_INFO) {
        
        // read whether the chunk is the A version
        ds_map_add(server_rooms, "TL", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "TM", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "TR", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "ML", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "C",  buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "MR", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "BL", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "BM", buffer_read(connection_buffer, buffer_bool))
        ds_map_add(server_rooms, "BR", buffer_read(connection_buffer, buffer_bool))
        
        return;
        
    }
    
    if (identifier == NETWORK.YOU) {
        
        id_on_server = buffer_read(connection_buffer, buffer_u16);
        ds_map_add(elements, id_on_server, obj_Player);
        
        return;
        
    }
    
    var other_player_id = buffer_read(connection_buffer, buffer_u16);
    // ignore packets regarding self
    if (instance_exists(obj_Player) && other_player_id == id_on_server) {
        return;
    }
    
    var other_player_room = buffer_read(connection_buffer, buffer_u32);
    var other_player_x  = buffer_read(connection_buffer, buffer_s16);
    var other_player_y  = buffer_read(connection_buffer, buffer_s16);
    
    if (identifier == NETWORK.ADD_ELEMENT) {
        
        var new_player = instance_create_layer(other_player_x, other_player_y, "Instances", obj_OtherPlayer);
        if (instance_exists(obj_Player) && other_player_room != obj_Player.current_room) {
            new_player.visible = 0;
        }
        ds_map_add(elements, other_player_id, new_player);
        return;
        
    }
    
    var other_player = ds_map_find_value(elements, other_player_id);
    
    if (identifier == NETWORK.DELETE_ELEMENT) {
        
        if (other_player.cutter != noone) {
            instance_destroy(other_player.cutter);
        }
        instance_destroy(other_player);
        ds_map_delete(elements, other_player);
        
    } else if (identifier == NETWORK.MOVEMENT) {
        
        other_player.current_room = other_player_room;
        
        if (instance_exists(obj_Player) &&  obj_Player.current_room != other_player_room) {
            other_player.visible = 0;
            other_player.x = room_width / 2;
            other_player.y = room_height / 2;
        } else {
            other_player.visible = 1;
            other_player.x = other_player_x;
            other_player.y = other_player_y;
        }
        
    } else if (identifier == NETWORK.ITEM) {
        
        var item = buffer_read(connection_buffer, buffer_u8);
        
        if (item == PICKUPS.TAFT) {
            
            if (buffer_read(connection_buffer, buffer_bool)) {
                other_player.image_alpha = 0.2;
                other_player.is_invis = true;
            } else {
                other_player.image_alpha = 1;
                other_player.is_invis = false;
            }
            
        } else if (item == PICKUPS.DECOY) {
            
            // TODO: Handle this better
            ds_list_add(decoy_rooms, other_player_room);
            
        } else if (item == PICKUPS.PIZZA_CUTTER) {
            
            var cutter = instance_create_layer(other_player_x, other_player_y, "Instances", obj_PizzaCutterToHold);
            cutter.my_player = other_player;
            other_player.wep_held = cutter;
            
        }
        
    } else if (identifier == NETWORK.ATTACK) {
        
        with (other_player.wep_held) {
            image_index++;
            alarm[0] = 30;
        }
        
        var target_player_id = buffer_read(connection_buffer, buffer_u16);
        var target_player = ds_map_find_value(elements, target_player_id);
        
        if (!is_undefined(target_player) && target_player.player_hp > 0) {
            target_player.player_hp -= 15;
            
            if (target_player.player_hp <= 0) {
                obj_Player.wep_held.target = noone;
            }
        }
        
    } else if (identifier == NETWORK.DEATH) {
        
        if (other_player.wep_held != noone) {
            instance_destroy(other_player.wep_held);
            other_player.wep_held = noone;
        }
        
    } else if (identifier == NETWORK.YOU_LOST) {
        
        global.game_state == "You lost!";
        room_goto(EndStateRoom);
        
    }
    
}