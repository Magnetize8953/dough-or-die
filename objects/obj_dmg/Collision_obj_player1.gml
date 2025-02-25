if (other.plane_health > 0) {

    other.plane_health -= 40;

    if (other.plane_health <= 0) {
        other.plane_health = 0;  
        show_debug_message("Player destroyed!");
        instance_destroy(other);
    }
	instance_destroy();
}
