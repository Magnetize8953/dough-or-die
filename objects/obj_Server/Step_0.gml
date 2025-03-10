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

// send host information to everyone
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