draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var room_center = x + (room_width / 2);

// title
draw_text_transformed_color(room_center, y + (font_get_size(fnt_main) / 2 - pos), "Credits", 1.5, 1.5, 0, c_white, c_white, c_white, c_white, 1);

// devs
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 2 - pos), "Kialey", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 3 - pos), "Andy", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 4 - pos), "Devdan", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 5 - pos), "Ukiah", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 6 - pos), "ChatGPT", c_white, c_white, c_white, c_white, 1);

// music
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 8 - pos), "Audio", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 9 - pos), "Kevin MacLeod, Pinball Spring", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 10 - pos), "Chaytonman, No Time", c_white, c_white, c_white, c_white, 1);
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 11 - pos), "Kenney, General Sound Effects", c_white, c_white, c_white, c_white, 1);

/* to be added */
draw_text_color(room_center, y + ((font_get_size(fnt_main) + 50) * 14 - pos), "And more...", c_white, c_white, c_white, c_white, 1);