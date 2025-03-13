// Attribution: Corvo, https://www.youtube.com/channel/UCZvLFOWD6r7Cj11Rrp9Rpzg
// [Tutorial - Parte 1] Networking no GameMaker✨, https://youtu.be/tA3_2_aQTtM
// [Tutorial - Parte 2] Networking no GameMaker✨, https://youtu.be/-jxIrGDo61k
// actually showcased and explained networking in GameMaker

event_inherited();

max_clients = 4;
port = 50000;

// associates sockets with players
clients = ds_map_create();
// just a list of sockets
sockets = ds_list_create();

server = network_create_server(network_socket_tcp, port, max_clients);
// 16KB buffer because...
buffer = buffer_create(16384, buffer_grow, 1);

host_x = 0;
host_y = 0;