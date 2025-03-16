if (player_hp <= 0) {
    scr_PlayerDeath(self);
}

if (previous_x > x) {
	image_xscale = -abs(image_xscale);
}
if (previous_x < x) {
    image_xscale = abs(image_xscale);
}

previous_x = x;
previous_image_xscale = image_xscale;