show_debug_message("*plays click sound*");

if (option != noone && string_count("quit", option) > 0) {
    game_end();
}
if (obj != noone) {
    instance_destroy(obj_Popup);
    var new_obj = instance_create_layer(room_width / 2, room_height / 2, "Instances", obj);
    new_obj.image_speed = 0;
    new_obj.image_index = sprite_num;
}
if (other_room != noone) {
    room_goto(other_room);
}