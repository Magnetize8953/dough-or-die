// send everyone's information to everyone
for (var i = 0; i < instance_number(obj_OtherPlayer); i++) {
    // index through obj_OtherPlayer instances in room
    var player = instance_find(obj_OtherPlayer, i);
    
    // write into the buffer the current player's coordinates
    buffer_seek(buffer, buffer_seek_start, 1);
    buffer_write(buffer, buffer_u8, NETWORK.MOVEMENT);
    buffer_write(buffer, buffer_u16, player.id);
    buffer_write(buffer, buffer_u32, player.current_room);
    buffer_write(buffer, buffer_s16, player.x);
    buffer_write(buffer, buffer_s16, player.y);
    
    for (var j = 0; j < ds_list_size(sockets); j++) {
        // index through sockets
        var socket = ds_list_find_value(sockets, j);
        
        // if the socket is that of the current player index
        // skip to prevent ghost player effect
        if ds_map_find_value(clients, socket) == player {
            continue;
        }
        
        // send to all sockets (bc loop) the current player's coords
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
}

// TODO: Make a better way to handle before the player is made
if (!instance_exists(obj_Player)) {
    return;
}

// send host information to everyone
// notify of death
// image scale is used for falling death
if (obj_Player.player_hp <= 0 || (obj_Player.image_xscale <= 0.1 || obj_Player.image_yscale <= 0.1 )) {
    for (var j = 0; j < ds_list_size(sockets); j++) {
        var socket = ds_list_find_value(sockets, j);
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.DEATH);
        buffer_write(buffer, buffer_u16, obj_Player.id);
        buffer_write(buffer, buffer_u32, 0);
        buffer_write(buffer, buffer_s16, 0);
        buffer_write(buffer, buffer_s16, 0);
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
}

// only send location if it has changed
if (obj_Player.x != host_x || obj_Player.y != host_y) {
    for (var j = 0; j < ds_list_size(sockets); j++) {
        host_x = obj_Player.x;
        host_y = obj_Player.y;
        
        var socket = ds_list_find_value(sockets, j);
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.MOVEMENT);
        buffer_write(buffer, buffer_u16, obj_Player.id);
        buffer_write(buffer, buffer_u32, obj_Player.current_room);
        buffer_write(buffer, buffer_s16, obj_Player.x);
        buffer_write(buffer, buffer_s16, obj_Player.y);
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
}

if (obj_Player.is_invis != host_invis) {
    
    host_invis = obj_Player.is_invis;
    
    for (var j = 0; j < ds_list_size(sockets); j++) {
        var socket = ds_list_find_value(sockets, j);
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.ITEM);
        buffer_write(buffer, buffer_u16, obj_Player.id);
        buffer_write(buffer, buffer_u32, 0);
        buffer_write(buffer, buffer_s16, 0);
        buffer_write(buffer, buffer_s16, 0);
        buffer_write(buffer, buffer_u8, PICKUPS.TAFT);
        if (host_invis) {
            buffer_write(buffer, buffer_bool, true);
        } else {
            buffer_write(buffer, buffer_bool, false);
        }
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
}

if (obj_Player.can_spawn_decoy != host_can_spawn_decoy) {
    
    host_can_spawn_decoy = obj_Player.can_spawn_decoy;
    
    if (!host_can_spawn_decoy && keyboard_check_pressed(ord("C"))) {
        
        for (var j = 0; j < ds_list_size(sockets); j++) {
            var socket = ds_list_find_value(sockets, j);
            
            buffer_seek(buffer, buffer_seek_start, 1);
            buffer_write(buffer, buffer_u8, NETWORK.ITEM);
            buffer_write(buffer, buffer_u16, obj_Player.id);
            buffer_write(buffer, buffer_u32, obj_Player.current_room);
            buffer_write(buffer, buffer_s16, obj_Player.x);
            buffer_write(buffer, buffer_s16, obj_Player.y);
            buffer_write(buffer, buffer_u8, PICKUPS.DECOY);
            
            network_send_packet(socket, buffer, buffer_tell(buffer));
        }
        
    }
}

if (obj_Player.wep_held != noone && !host_has_cutter) {
    
    host_has_cutter = true;
    
    for (var j = 0; j < ds_list_size(sockets); j++) {
        var socket = ds_list_find_value(sockets, j);
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.ITEM);
        buffer_write(buffer, buffer_u16, obj_Player.id);
        buffer_write(buffer, buffer_u32, obj_Player.current_room);
        buffer_write(buffer, buffer_s16, obj_Player.x);
        buffer_write(buffer, buffer_s16, obj_Player.y);
        buffer_write(buffer, buffer_u8, PICKUPS.PIZZA_CUTTER);
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
}

if (host_has_cutter && keyboard_check_pressed(vk_space) && obj_Player.wep_held.damaged) {
    for (var j = 0; j < ds_list_size(sockets); j++) {
        var socket = ds_list_find_value(sockets, j);
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.ATTACK);
        buffer_write(buffer, buffer_u16, obj_Player.id);
        buffer_write(buffer, buffer_u32, 0);
        buffer_write(buffer, buffer_s16, 0);
        buffer_write(buffer, buffer_s16, 0);
        if (!is_undefined(obj_Player.wep_held.target)) {
            buffer_write(buffer, buffer_u16, obj_Player.wep_held.target);
        } else {
            buffer_write(buffer, buffer_u16, 0);
        }
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
    }
}