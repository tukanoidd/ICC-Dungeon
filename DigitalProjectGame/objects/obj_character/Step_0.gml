if (!position_meeting(mouse_x, y, self)) {
	direction = point_direction(x, y, mouse_x, y);
	speed = 10;
}

else {
	speed = 0;
}