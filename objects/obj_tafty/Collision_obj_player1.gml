if (!other.is_invis) {
    other.is_invis = true;


    // Change the player's sprite to show they have the weapon
    other.sprite_index = spr_player_invis;
	
	other.image_alpha = 0.2;
    
    instance_destroy(); // Remove the pickup from the room
}