var create_server = keyboard_check_pressed(ord("0"));
var join_server   = keyboard_check_pressed(ord("1"));

if (create_server and !instance_exists(obj_Server)) {
    show_debug_message("Creating server...");
    instance_create_layer(-1, -1, "Instances", obj_Server);
} else if (join_server and !instance_exists(obj_Client)) {
    show_debug_message("Creating client...");
    instance_create_layer(-1, -1, "Instances", obj_Client);
}