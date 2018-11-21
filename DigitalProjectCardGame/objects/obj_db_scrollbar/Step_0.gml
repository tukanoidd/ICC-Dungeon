/// @description scroll

if(disabled) { exit; }

//change value when scrolling
if(scrolling) {

	if(vertical) {
		bar_y = clamp(mouse_y - y - bar_height div 2,0,sprite_height-bar_height);
		value = bar_y / (sprite_height-bar_height);
	}
	else {
		bar_x = clamp(mouse_x - x - bar_width div 2,0,sprite_width-bar_width);
		value = bar_x / (sprite_width-bar_width);
	}

}
//change bar based on value
else {

	if(vertical) {
		bar_y = round(value * (sprite_height-bar_height));
	}
	else {
		bar_x = round(value * (sprite_width-bar_width));
	}

}