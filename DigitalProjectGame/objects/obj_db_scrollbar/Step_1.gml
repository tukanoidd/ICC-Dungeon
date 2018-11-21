/// @description capture input

if(disabled) { exit; }

if(scrolling) {

	if(!mouse_check_button(mb_left)) {
		scrolling = false;
	}

}
else {

	if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)) {
		scrolling = true;		
	}

}
