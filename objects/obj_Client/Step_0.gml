// TODO: Make a better way to handle before the player is made
if (!instance_exists(obj_Player)) {
    return;
}

// send location data to server
buffer_seek(buffer, buffer_seek_start, 1);
buffer_write(buffer, buffer_u8, NETWORK.MOVEMENT);
buffer_write(buffer, buffer_u16, id_on_server);
buffer_write(buffer, buffer_u32, obj_Player.current_room);
buffer_write(buffer, buffer_s16, obj_Player.x);
buffer_write(buffer, buffer_s16, obj_Player.y);

network_send_packet(client_socket, buffer, buffer_tell(buffer));

// TODO: Handle better
// spawn decoys
var decoy_room_pos = ds_list_find_index(decoy_rooms, room);
if (decoy_room_pos != -1) {
    instance_create_layer(0, 0, "Instances", obj_PepDecoy);
    ds_list_delete(decoy_rooms, decoy_room_pos);
}

if (obj_Player.is_invis != client_invis) {
    
    client_invis = obj_Player.is_invis;
        
    buffer_seek(buffer, buffer_seek_start, 1);
    buffer_write(buffer, buffer_u8, NETWORK.ITEM);
    buffer_write(buffer, buffer_u16, id_on_server);
    buffer_write(buffer, buffer_u32, 0);
    buffer_write(buffer, buffer_s16, 0);
    buffer_write(buffer, buffer_s16, 0);
    buffer_write(buffer, buffer_u8, PICKUPS.TAFT);
    if (client_invis) {
        buffer_write(buffer, buffer_bool, true);
    } else {
        buffer_write(buffer, buffer_bool, false);
    }
    
    network_send_packet(client_socket, buffer, buffer_tell(buffer));
    
}

if (obj_Player.can_spawn_decoy != client_can_spawn_decoy) {
    
    client_can_spawn_decoy = obj_Player.can_spawn_decoy;
    
    if (!client_can_spawn_decoy && keyboard_check_pressed(ord("C"))) {
        
        buffer_seek(buffer, buffer_seek_start, 1);
        buffer_write(buffer, buffer_u8, NETWORK.ITEM);
        buffer_write(buffer, buffer_u16, id_on_server);
        buffer_write(buffer, buffer_u32, obj_Player.current_room);
        buffer_write(buffer, buffer_s16, obj_Player.x);
        buffer_write(buffer, buffer_s16, obj_Player.y);
        buffer_write(buffer, buffer_u8, PICKUPS.DECOY);
        
        network_send_packet(client_socket, buffer, buffer_tell(buffer));
        
    }
}

// picking up pizza cutter
if (obj_Player.wep_held != noone && !client_has_cutter) {
    
    client_has_cutter = true;
    
    buffer_seek(buffer, buffer_seek_start, 1);
    buffer_write(buffer, buffer_u8, NETWORK.ITEM);
    buffer_write(buffer, buffer_u16, id_on_server);
    buffer_write(buffer, buffer_u32, obj_Player.current_room);
    buffer_write(buffer, buffer_s16, obj_Player.x);
    buffer_write(buffer, buffer_s16, obj_Player.y);
    buffer_write(buffer, buffer_u8, PICKUPS.PIZZA_CUTTER);
    
    network_send_packet(client_socket, buffer, buffer_tell(buffer));
    
}

// TODO: fix random crashes after attacking
// send attack
if (client_has_cutter && keyboard_check_pressed(vk_space) && !obj_Player.wep_held.swung) {
    
    buffer_seek(buffer, buffer_seek_start, 1);
    buffer_write(buffer, buffer_u8, NETWORK.ATTACK);
    buffer_write(buffer, buffer_u16, id_on_server);
    buffer_write(buffer, buffer_u32, 0);
    buffer_write(buffer, buffer_s16, 0);
    buffer_write(buffer, buffer_s16, 0);
    buffer_write(buffer, buffer_u16, obj_Player.wep_held.target);
    
    network_send_packet(client_socket, buffer, buffer_tell(buffer));
    
}