// Handles player falling into pit

image_xscale = abs(image_xscale) - 0.05;
image_yscale -= 0.05;
if image_xscale <= 0.1 or image_yscale <= 0.1 {
	scr_PlayerDeath(self);
} else {
	alarm[1] = 5;
}