if (sprite_index == door_open) { 
	if (global.stage == 7) room_goto_next(); 
	else { 
		card_generator();
		sprite_index = door; 
		char = instance_find(obj_character, 0); char.x = 224;
	}
}