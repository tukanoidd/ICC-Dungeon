if (!position_meeting(mouse_x, y, self)) {
	direction = point_direction(x, y, mouse_x, y);
	speed = 18;
}

else {
	sprite_index = character;
	speed = 0;
}

if (x + 64 < mouse_x) sprite_index = character_right;
else if (x > mouse_x) sprite_index = character_left;