if other.wep_held != self and !other.is_invis and !damaged and swung {
	other.health -= 15;
	damaged = true;
}