if (x == target_x) { 
	speed = 0; 
	if (ans_num == 4) {
		char = instance_find(obj_character, 0);
		char.can_go = true;
	}
}

else if (x < target_x  && x + spd > target_x) { x += (target_x - x); speed = 0; }