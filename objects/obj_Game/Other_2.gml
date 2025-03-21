// Set our drawing font for the menu
draw_set_font(fnt_main);


// Set our global variables to noone
global.room_object_map = noone;
global.TL = noone;
global.TM = noone;
global.TR = noone;
global.ML = noone;
global.C = noone;
global.MR = noone;
global.BL = noone;
global.BM = noone;
global.BR = noone;
global.tl_east = noone;
global.tl_south = noone;
global.tm_west = noone;
global.tm_east = noone;
global.tm_south = noone;
global.tr_west = noone;
global.tr_south = noone;
global.ml_north = noone;
global.ml_east = noone;
global.ml_south = noone;
global.c_north = noone;
global.c_west = noone;
global.c_east = noone;
global.c_south = noone;
global.mr_north = noone;
global.mr_west = noone;
global.mr_south = noone;
global.bl_north = noone;
global.bl_east = noone;
global.bm_north = noone;
global.bm_west = noone;
global.bm_east = noone;
global.br_north = noone;
global.br_west = noone;
global.cheat_code_room_name = false;
global.map_generated = false;

// play background music when the game starts in the menu
global.background_music = audio_play_sound(snd_MenuMusic, 1, true);

// winner-loser
global.game_state = "unknown";