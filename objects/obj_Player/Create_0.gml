persistent = true;
player_hp = 100;
falling = false;
speed_timer = 0;
invis_timer = 0;
item_notif_timer = 0;

// easter egg
buttons_pressed[0] = false;
buttons_pressed[1] = false;
buttons_pressed[2] = false;
image_xscale = 1;
image_yscale = 1;

// room player is trying to get to
if (!instance_exists(obj_Client)) {
    target_room = Player2Base;
} else {
    target_room = Player1Base;
}

// networking
current_room = room;