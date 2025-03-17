draw_self();
if(collision_happened && draw_once){
	draw_once = false;
	draw_set_halign(fa_center);
	draw_text_transformed(x + 30, y - 30, "Hello Player Welcome To The Maze!", 2 , 2, image_angle);
	draw_set_halign(fa_left);
}

