if (other.object_index == obj_player1) {
    other.player_hp = min(other.player_hp + 30, 100);
    instance_destroy();
}
