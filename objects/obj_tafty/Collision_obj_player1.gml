if (!other.is_invis) {
    other.is_invis = true;

    other.sprite_index = spr_player_invis;
	
	other.image_alpha = 0.2;
    
    instance_destroy();
}