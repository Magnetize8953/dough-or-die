if wep_held != noone {
	instance_destroy(wep_held);
}
room_goto(Player1Base);
instance_create_layer(600, 500, "Instances", obj_Player);