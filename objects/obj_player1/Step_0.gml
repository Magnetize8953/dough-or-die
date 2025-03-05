hspeed = 0;
vspeed = 0;

if (keyboard_check(vk_left))  hspeed = -move_speed;
if (keyboard_check(vk_right)) hspeed = move_speed;
if (keyboard_check(vk_up))    vspeed = -move_speed;
if (keyboard_check(vk_down))  vspeed = move_speed;

if(abs(hspeed) > 0 || abs(vspeed) > 0){
	image_speed = 1;
} else {
	image_speed = 0;
	image_index = 0;
}

if (item_timer > 0) {
    item_timer -= 1;
}

if (speed_timer > 0) {
    speed_timer -= 1;
} else {
    move_speed = 4;
}

if (attack_cooldown > 0) {
    attack_cooldown -= 1;
}

if (has_weapon && weapon == "pizza_cutter" && (keyboard_check_pressed(vk_space) || mouse_check_button_pressed(mb_left))) {
    if (attack_cooldown <= 0) {
        swing_weapon();
    }
}

if (is_attacking) {
    if (image_index >= image_number - 1) { 
        is_attacking = false;
        sprite_index = old;
    }
}

