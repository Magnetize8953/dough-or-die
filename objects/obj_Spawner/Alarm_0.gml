if (variable_instance_exists(id, global.map_generated) && global.map_generated) {
    randomize();
    
    // one-in-eight chance of spawning power-up
    var spawn_chance = irandom(7);
    if spawn_chance == 7 {
        
        // Pick random x and y for power up 
        var randx = irandom_range(220, 1700);
        var randy = irandom_range(220, 860);
        var powerup = irandom(2); // 1/3 for each power-up
        
        if powerup == 0 { // Create 2.5 of spades
            instance_create_layer(randx, randy, "Instances", obj_25OfSpades); 
        } else if powerup == 1 { // Create Ghost of Taft
            instance_create_layer(randx, randy, "Instances", obj_Taft);
        } else { //C reate Hydra
            instance_create_layer(randx, randy, "Instances", obj_Hydra);
        }
        
    }
    
    instance_destroy();
} else {
    alarm[0] = 5;
}