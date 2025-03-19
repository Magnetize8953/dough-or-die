draw_self();

if (enemy_close) {
    draw_set_halign(fa_center);
    draw_text(x, y, "The enemy is close to your base...");
}

if (current_room != noone) {
    draw_set_halign(fa_center);
    draw_text(x, y, "We're currently in " + string(room_get_name(current_room)));
}