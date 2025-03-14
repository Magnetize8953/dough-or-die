var event_id = async_load[? "id"];

if (event_id == server) {
    var type = async_load[? "type"];
    var socket = async_load[? "socket"];
    
    if (type == network_type_connect) {
        
        ds_list_add(sockets, socket);
        var new_player = instance_create_layer(0, 0, "Instances", obj_OtherPlayer);
        ds_map_add(clients, socket, new_player);
        
        // send map information
        #region send map info
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.MAP_INFO);
        
        // send whether or not a chunk is the A version
        buffer_write(buffer, buffer_bool, global.TL.EastExit == TLaRoom1 ? true : false)
        buffer_write(buffer, buffer_bool, global.TM.WestExit == TMaRoom1 ? true : false)
        buffer_write(buffer, buffer_bool, global.TR.WestExit == TRaRoom5 ? true : false)
        buffer_write(buffer, buffer_bool, global.ML.EastExit == MLaRoom4 ? true : false)
        buffer_write(buffer, buffer_bool, global.C.NorthExit == CaRoom1  ? true : false)
        buffer_write(buffer, buffer_bool, global.MR.WestExit == MRaRoom3 ? true : false)
        buffer_write(buffer, buffer_bool, global.BL.EastExit == BLaRoom4 ? true : false)
        buffer_write(buffer, buffer_bool, global.BM.EastExit == BMaRoom1 ? true : false)
        buffer_write(buffer, buffer_bool, global.BR.WestExit == BRaRoom5 ? true : false)
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
        
        #endregion
        
        for (var i = 0; i < instance_number(obj_OtherPlayer); i++) {
            // give new player old players information
            var other_player = instance_find(obj_OtherPlayer, i);
            
            buffer_seek(buffer, buffer_seek_start, 1);
            buffer_write(buffer, buffer_u8, NETWORK.ADD_ELEMENT);
            buffer_write(buffer, buffer_u16, other_player.id);
            buffer_write(buffer, buffer_u32, other_player.current_room);
            buffer_write(buffer, buffer_s16, other_player.x);
            buffer_write(buffer, buffer_s16, other_player.y);
            
            network_send_packet(socket, buffer, buffer_tell(buffer));
            
            // give old players new player information
            var other_player_socket = ds_list_find_value(sockets, i);
            
            buffer_seek(buffer, buffer_seek_start, 1);
            buffer_write(buffer, buffer_u8, NETWORK.ADD_ELEMENT);
            buffer_write(buffer, buffer_u16, new_player.id);
            buffer_write(buffer, buffer_u32, new_player.current_room);
            buffer_write(buffer, buffer_s16, new_player.x);
            buffer_write(buffer, buffer_s16, new_player.y);
            
            network_send_packet(other_player_socket, buffer, buffer_tell(buffer));

        }
        
        // give new player server host information
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.ADD_ELEMENT);
        buffer_write(buffer, buffer_u16, obj_Player.id);
        buffer_write(buffer, buffer_u32, obj_Player.current_room);
        buffer_write(buffer, buffer_s16, obj_Player.x);
        buffer_write(buffer, buffer_s16, obj_Player.y);
        
        network_send_packet(socket, buffer, buffer_tell(buffer));
        
    } else if (type == network_type_disconnect) {
        
        var leaving_player = clients[? socket];
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.DELETE_ELEMENT);
        buffer_write(buffer, buffer_u16, leaving_player.id);
        // buffer segments for consistency when reading later
        // otherwise the obj_client code for network events would be reshuffled weirdly
        buffer_write(buffer, buffer_u32, 0);
        buffer_write(buffer, buffer_s16, 0);
        buffer_write(buffer, buffer_s16, 0);
        
        // send all players information on leaving player
        for (var j = 0; j < ds_list_size(sockets); j++) {
            var player_socket = ds_list_find_value(sockets, j);
            network_send_packet(player_socket, buffer, buffer_tell(buffer));
        }
        
        instance_destroy(leaving_player);
        ds_list_delete(sockets, ds_list_find_index(sockets, socket));
        ds_map_delete(clients, socket);
        
    }
    
} else if (event_id != server) { // non-connection packets from clients
    
    var socket = async_load[? "id"];
    var connection_buffer = async_load[? "buffer"];
    var player = clients[? socket];
    
    buffer_seek(connection_buffer, buffer_seek_start, 1);
    var identifier = buffer_read(connection_buffer, buffer_u8);
    
    if (identifier == NETWORK.MOVEMENT) {
        var player_room = buffer_read(connection_buffer, buffer_u32);
        player.current_room = player_room;
        
        if (player_room == obj_Player.current_room) {
            var player_x = buffer_read(connection_buffer, buffer_s16);
            var player_y = buffer_read(connection_buffer, buffer_s16);
            
            player.x = player_x;
            player.y = player_y;
        } else {
            player.x = room_width / 2;
            player.y = room_height / 2;
        }
    }
    
}