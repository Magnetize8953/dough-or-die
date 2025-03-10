client_socket = network_create_socket(network_socket_tcp);
ip = "127.0.0.1";
port = 50000;

buffer = buffer_create(16384, buffer_grow, 1);
// associates player ids with objects
elements = ds_map_create();

connection = network_connect(client_socket, ip, port);
if (connection < 0) {
    show_debug_message("failed to connect to server");
    instance_destroy(self);
}