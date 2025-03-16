// If health less than 0, destroy
if player_hp <= 0 {
	scr_PlayerDeath(true);
}

// Handles checking if the player has picked up a speed boost
if (speed_timer > 0) {
    speed_timer -= 1;
	item_notif_timer -= 1;
} else {
    move_speed = 12;
	if (self.is_invis) {
		move_speed = 8;
	}
}

// Handles the player going invisible and invincible
if (invis_timer > 0) {
	invis_timer -= 1;
	item_notif_timer -= 1;
} else {
	self.is_invis = false;
	image_alpha = 1;
	move_speed = 12;
	if (speed_timer > 0) {
		move_speed *= 2.5;
	}
}

// Handles if player spawns decoy
if (can_spawn_decoy and keyboard_check_pressed(ord("C"))) {
	can_spawn_decoy = false;
	instance_create_layer(x, y, "Instances", obj_PepDecoy);
}



// Movement
if keyboard_check(ord("A")) and !instance_place(x - move_speed, y, obj_Barrier) and !self.disable_west and x - move_speed > 90 {
	x -= self.move_speed * abs(image_xscale); // Funny exponential get smaller when falling
	image_xscale = -abs(image_xscale);
}

if keyboard_check(ord("D")) and !instance_place(x + move_speed, y, obj_Barrier) and !self.disable_east and x + move_speed < 1830 {
	x += self.move_speed * abs(image_xscale); // Funny exponential get smaller when falling
	image_xscale = abs(image_xscale);
}

if keyboard_check(ord("W")) and !instance_place(x, y - move_speed, obj_Barrier) and !self.disable_north and y - move_speed > 90 {
	y -= self.move_speed * image_yscale; // Funny exponential get smaller when falling
}

if keyboard_check(ord("S")) and !instance_place(x, y + move_speed, obj_Barrier) and !self.disable_south and y + move_speed < 990 {
	y += self.move_speed * image_yscale; // Funny exponential get smaller when falling
}

x = clamp(x, sprite_width/2, room_width-sprite_width/2);

y = clamp(y, sprite_height/2, room_height-sprite_height/2);


if keyboard_check(ord("W")) || keyboard_check(ord("A")) || keyboard_check(ord("S")) ||keyboard_check(ord("D")) {
	// pizza go spinny
	image_speed = 1;
  
} else {
	// pizza no spinny
	image_speed = 0;
}


if !keyboard_check(vk_alt) and keyboard_check_pressed(ord("R")){
	instance_deactivate_all(false);
	game_restart();
}


// If the center chunk has been made, and its the B option (has secret room)
if global.C != noone and array_length(global.C.RoomList) > 0 {
	if global.C.RoomList[0] == CbRoom1 {
		// If all three buttons pressed, jump to secret room and set tracking to false
		if buttons_pressed[0] and buttons_pressed[1] and buttons_pressed[2] {
			room_goto(CbRoomHeart);
			x = 300; y = 810;
			buttons_pressed[0] = false;
			buttons_pressed[1] = false;
			buttons_pressed[2] = false;
		}
	}
}

// attacking with pizza cutter
if (wep_held != noone && keyboard_check_pressed(vk_space) && !wep_held.swung) {
    with (wep_held) {
        image_index++;
        swung = true;
        alarm[0] = 20;
    }
}

// networking
current_room = room;