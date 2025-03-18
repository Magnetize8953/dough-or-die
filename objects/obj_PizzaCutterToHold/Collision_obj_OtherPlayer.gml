target = other;

if (other != my_player && !other.is_invis && !damaged && swung && other.visible == 1) {
    show_debug_message("damage dealt");
    audio_play_sound(snd_Hit, 1, false);
    damaged = true;
}

alarm[0] = 20;