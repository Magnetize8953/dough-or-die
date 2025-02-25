if (!other.has_weapon) {
    other.has_weapon = true;
    other.weapon = "pizza_cutter"; // Assign weapon type

    // Change the player's sprite to show they have the weapon
    other.sprite_index = spr_player_with_pizza_cutter;

    show_debug_message("Player picked up the pizza cutter!");
    
    instance_destroy(); // Remove the pickup from the room
}
