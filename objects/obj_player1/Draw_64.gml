// Draw Health Bar (Top-Left Corner)
draw_healthbar(20, 20, 220, 40, plane_health, c_black, c_red, c_lime, 0, true, 1);

// Display Health as Text Below the Bar
draw_set_color(c_white);
draw_text(30, 45, "HP: " + string(plane_health));

// Display Item Pickup Notification (Centered at the Top)
if (item_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_white);
    draw_text(room_width / 2, 50, "Picked up: " + item_name);
}

// Display Speed Boost Timer (Centered Below the Item Name)
if (speed_timer > 0) {
    draw_set_halign(fa_center);
    draw_set_valign(fa_middle);
    draw_set_color(c_lime);
    draw_text(room_width / 2, 80, "Speed Boost Active: " + string(ceil(speed_timer / 60)) + "s");
}
