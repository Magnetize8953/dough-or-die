draw_self();
if(!close && !far){
	draw_set_halign(fa_center);
	draw_text_transformed(x + 30, y - 30, "Hello Player, Good Luck!...", 1, 1, image_angle);
	draw_set_halign(fa_left);
}

if(far){
	draw_set_halign(fa_center);
	draw_text_transformed(x + 30, y - 30, "You are far from your destinaiton...", 1, 1, image_angle);
	draw_set_halign(fa_left);
}
if(close){
	draw_set_halign(fa_center);
	draw_text_transformed(x + 30, y - 30, "You are close to your destinaiton...", 1, 1, image_angle);
	draw_set_halign(fa_left);
}
if(enemy_close && !close && !far){
	draw_set_halign(fa_center);
	draw_text_transformed(x + 30, y - 30, "The enemy is close to your base...", 1, 1, image_angle);
	draw_set_halign(fa_left);
}
if(enemy_far && !close && !far){
	draw_set_halign(fa_center);
	draw_text_transformed(x + 30, y - 30, "The enemy is far from your base...", 1, 1, image_angle);
	draw_set_halign(fa_left);
}

