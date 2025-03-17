enemy_hp = 20;
enemy_attack_power = 3;

hsp = 10; 
hspeed = hsp;

path_start(enemy, hsp, path_action_restart, true);

attack_range = 300;

persistent = false;

tracking = false;
map_done = false;
a_option = false;
b_option = false;

var delay = 60 * 1;
alarm[0] = delay;
alarm[1] = delay;


