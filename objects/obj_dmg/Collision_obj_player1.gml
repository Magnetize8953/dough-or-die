if (other.player_hp > 0) {

    other.player_hp -= 40;

    if (other.player_hp <= 0) {
        other.player_hp = 0;  
        show_debug_message("Player destroyed!");
        instance_destroy(other);
    }
	instance_destroy();
}
