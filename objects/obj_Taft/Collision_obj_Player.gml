if (!other.is_invis) {
    other.is_invis = true;
	other.image_alpha = 0.2;
    other.invis_timer = 3600;
	other.item_name = "Ghost of William Howard Taft";
	other.move_speed *= (2/3);
	other.item_timer = 600;
    instance_destroy();
}