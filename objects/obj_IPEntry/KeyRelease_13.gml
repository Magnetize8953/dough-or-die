if (ip == "l") {
    ip = "127.0.0.1";
}

var sock = network_create_socket(network_socket_tcp);
var port_num = 50000;

var conn = network_connect(sock, ip, port_num);
if (conn < 0) {
    
    show_debug_message("failed to connect to server");
    ip = "Enter Server IP";
    instance_destroy(self);
    
} else {
    
    instance_create_layer(0, 0, "Instances", obj_Client, { 
        client_socket : sock,
        port : port_num,
        connection : conn 
    });
    instance_destroy(self);
    room_goto(BRaRoom1);
    
}