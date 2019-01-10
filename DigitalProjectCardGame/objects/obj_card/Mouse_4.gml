if (x == target_x && global.cards_cliked < 1) { 
	sprite_index = card_face_spr; 
	pressed = true;
	global.cards_cliked++;
	first_clicked = true;
}