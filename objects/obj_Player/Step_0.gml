// Handles checking if the player has picked up a speed boost
if (speed_timer > 0) {
    speed_timer -= 1;
	item_timer -= 1;
} else {
    move_speed = 12;
	if (self.is_invis) {
		move_speed = 8;
	}
}

if (invis_timer > 0) {
	invis_timer -= 1;
	item_timer -= 1;
} else {
	self.is_invis = false;
	image_alpha = 1;
	move_speed = 12;
	if (speed_timer > 0) {
		move_speed *= 2.5;
	}
}


// Movement
if keyboard_check(ord("A")) and !instance_place(x - move_speed, y, obj_Barrier) and !self.disable_west {
	x -= self.move_speed;
}

if keyboard_check(ord("D")) and !instance_place(x + move_speed, y, obj_Barrier) and !self.disable_east {
	x += self.move_speed;
}

if keyboard_check(ord("W")) and !instance_place(x, y - move_speed, obj_Barrier) and !self.disable_north {
	y -= self.move_speed;
}

if keyboard_check(ord("S")) and !instance_place(x, y + move_speed, obj_Barrier) and !self.disable_south {
	y += self.move_speed;
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


if keyboard_check_pressed(ord("R")){
	instance_deactivate_all(false);
	game_restart();
}

// JUMP TO OTHER CHUNK TO TEST
if keyboard_check_pressed(ord("B")) {
	room_goto(BMbRoom1);
}

// networking
current_room = room;