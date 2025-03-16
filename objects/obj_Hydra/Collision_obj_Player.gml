if (other.object_index == obj_Player) {
    other.item_name = "Hydra viridissima";
	other.can_spawn_decoy = true;
	other.item_notif_timer = 600;
    instance_destroy();
}