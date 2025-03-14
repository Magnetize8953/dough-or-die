if other.wep_held == noone {
	instance_destroy();
	var wep = instance_create_layer(other.x, other.y, "Instances", obj_PizzaCutterToHold);
	wep.my_player = other;
	other.wep_held = wep;
}