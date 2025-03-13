// TODO: Make a better way to handle before the player is made
if (!instance_exists(obj_Player)) {
    return;
}

var event_id = async_load[? "id"];

if (event_id == client_socket && event_id != 1) {
    
    var connection_buffer = async_load[? "buffer"];
    buffer_seek(connection_buffer, buffer_seek_start, 1);
    var identifier = buffer_read(connection_buffer, buffer_u8);
    show_debug_message(identifier);
    
    var other_player_id = buffer_read(connection_buffer, buffer_u16);
    // ignore packets regarding self
    if (other_player_id == obj_Player.id) {
        return;
    }
    
    var other_player_room = buffer_read(connection_buffer, buffer_u32);
    var other_player_x  = buffer_read(connection_buffer, buffer_s16);
    var other_player_y  = buffer_read(connection_buffer, buffer_s16);
    
    if (identifier == NETWORK.ADD_ELEMENT) {
        
        var new_player = instance_create_layer(other_player_x, other_player_y, "Instances", obj_OtherPlayer);
        if (other_player_room != obj_Player.current_room) {
            new_player.visible = 0;
        }
        ds_map_add(elements, other_player_id, new_player);
        return;
        
    }
    
    var other_player = ds_map_find_value(elements, other_player_id);
    
    if (identifier == NETWORK.DELETE_ELEMENT) {
        
        instance_destroy(other_player);
        ds_map_delete(elements, other_player);
        
    } else if (identifier == NETWORK.MOVEMENT) {
        
        other_player.current_room = other_player_room;
        
        if (obj_Player.current_room != other_player_room) {
            other_player.visible = 0;
            other_player.x = room_width / 2;
            other_player.y = room_height / 2;
        } else {
            other_player.visible = 1;
            other_player.x = other_player_x;
            other_player.y = other_player_y;
        }
        
    }
    
}