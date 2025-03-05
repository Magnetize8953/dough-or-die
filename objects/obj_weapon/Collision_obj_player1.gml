if (!other.has_weapon) {
    other.has_weapon = true;
    other.weapon = "pizza_cutter";

    // used chat here because did not remember how to change the sprite
    other.sprite_index = spr_player_with_pizza_cutter;

    show_debug_message("Player picked up the pizza cutter!");
    
    instance_destroy();
}
