// TODO: Make a better way to handle before the player is made
if (!instance_exists(obj_Player)) {
    return;
}

// send location data to server
buffer_seek(buffer, buffer_seek_start, 1);
buffer_write(buffer, buffer_u8, NETWORK.MOVEMENT);
buffer_write(buffer, buffer_u32, obj_Player.current_room);
buffer_write(buffer, buffer_s16, obj_Player.x);
buffer_write(buffer, buffer_s16, obj_Player.y);

network_send_packet(client_socket, buffer, buffer_tell(buffer));