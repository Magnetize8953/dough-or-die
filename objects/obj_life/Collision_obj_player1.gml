if (other.object_index == obj_player1) {
    other.plane_health = min(other.plane_health + 30, 100);
    instance_destroy();
}
