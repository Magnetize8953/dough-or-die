function inflict_damage(damage){
	obj_Player.health -= damage
	if obj_Player.health <= 0{
		instance_destroy(obj_Player)
	}
	instance_destroy() 
}