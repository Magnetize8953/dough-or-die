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
			x = 300;
			 y = 810;
			buttons_pressed[0] = false;
			buttons_pressed[1] = false;
			buttons_pressed[2] = false;
		}
	}
}

// networking
current_room = room;