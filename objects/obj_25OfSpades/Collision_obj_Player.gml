event_inherited();

if (other.object_index == obj_Player) {
    other.move_speed *= 2.5;
    other.item_name = "Two-and-a-Half of Spades";
    other.speed_timer = 3600;
	other.item_notif_timer = 600;
    instance_destroy();
}