if (other.object_index == obj_player1) {
    other.move_speed = min(other.move_speed + 2, 10);
    other.item_name = "Speed Boost";
    other.item_timer = 7200;
    other.speed_timer = 7200;
    instance_destroy();
}
