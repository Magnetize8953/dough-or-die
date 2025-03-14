x = my_player.x;
y = my_player.y;
image_xscale = my_player.image_xscale;
image_alpha = my_player.image_alpha;

if keyboard_check_pressed(vk_space) and !swung {
	image_index++;
	swung = true;
	alarm[0] = 30;
}