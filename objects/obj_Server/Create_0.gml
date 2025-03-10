max_clients = 4;
port = 50000;

// associates sockets with players
clients = ds_map_create();
// just a list of sockets
sockets = ds_list_create();

server = network_create_server(network_socket_tcp, port, max_clients);
// 16KB buffer because...
buffer = buffer_create(16384, buffer_grow, 1);

host_x = obj_Player.x;
host_y = obj_Player.y;