if (x == target_x && global.cards_cliked < 1) { 
	sprite_index = card_unlock; 
	pressed = true;
	global.cards_cliked++;
	first_clicked = true;
	global.char_points += points;
	global.next_level = true;
	global.dialog_read = false;
	
}