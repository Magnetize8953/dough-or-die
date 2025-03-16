target = other;

if (other != my_player && !other.is_invis && !damaged && swung && other.visible == 1) {
    show_debug_message("damage dealt")
    damaged = true;
}

alarm[0] = 20;