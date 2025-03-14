if global.map_generated {
randomize();

spawn_chance =irandom(7); // one-in-eight chance of spawning power-up
	if spawn_chance == 7 {
		// Pick random x and y for power up 
		randx = irandom_range(220, 1700);
		randy = irandom_range(220, 860);
		powerup = irandom(2); // 1/3 for each power-up
	
		if powerup == 0 { // Create 2.5 of spades
			instance_create_layer(randx, randy, "Instances", obj_25OfSpades); 
		} else if powerup == 1 { // Create Ghost of Taft
			instance_create_layer(randx, randy, "Instances", obj_Taft);
		} else { //Create Hydra
			instance_create_layer(randx, randy, "Instances", obj_Hydra);
		}
	}
	
	instance_destroy();
}