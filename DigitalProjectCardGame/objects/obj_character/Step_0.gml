if (!position_meeting(mouse_x, y, self)) {
	direction = point_direction(x, y, mouse_x, y);
	speed = 18;
	if (abs(x - mouse_button) < 18) x = mouse_x;
}

else speed = 0;

if (x + 64 < mouse_x) sprite_index = character_right;
else if (x > mouse_x) sprite_index = character_left;

if (speed == 0) {
	if (direction == 0) sprite_index = char_idle_right;
	else sprite_index = char_idle_left;
}