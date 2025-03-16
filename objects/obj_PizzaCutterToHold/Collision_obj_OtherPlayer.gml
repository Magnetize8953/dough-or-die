target = other;

if !other.is_invis and !damaged and swung {
    other.player_hp -= 15;
    damaged = true;
}

alarm[1] = 20;