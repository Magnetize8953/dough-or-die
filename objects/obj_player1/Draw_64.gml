// Used chatGPT here to get an idea of where toe place, I asked for top left 
// and these were the cordinates it gave and i liked the placement
// both if statements are absed off where the health bar is and were not made with chat
draw_healthbar(20, 20, 220, 40, player_hp, c_black, c_red, c_lime, 0, true, 1);

draw_set_color(c_white);
draw_text(30, 45, "HP: " + string(player_hp));

if (item_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(room_width / 2, 50, "Picked up: " + item_name);
}

if (speed_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_lime);
    draw_text(room_width / 2, 80, "Speed Boost Active: " + string(ceil(speed_timer / 60)) + "s");
}
