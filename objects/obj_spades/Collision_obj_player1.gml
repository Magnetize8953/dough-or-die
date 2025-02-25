if (other.object_index == obj_player1) {
    other.move_speed = min(other.move_speed + 2, 10); // Increase speed
    other.item_name = "Speed Boost"; // Set item name
    other.item_timer = 7200; // Display message for 2 seconds
    other.speed_timer = 7200; // Speed boost lasts for 2 minutes (60 steps * 120 seconds)
    instance_destroy();
}
