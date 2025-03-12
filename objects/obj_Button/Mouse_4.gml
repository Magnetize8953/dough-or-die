show_debug_message("*plays click sound*");

if (other_room != noone) {
    room_goto(other_room);
} else if (obj != noone) {
    instance_create_layer(0, 0, "Instances", obj);
} else if (option != noone && string_count("quit", option) > 0) {
    game_end();
}