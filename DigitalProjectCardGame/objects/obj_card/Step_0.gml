if (x == target_x) speed = 0;
else if (x < target_x  && x + spd > target_x) { x += (target_x - x); speed = 0; }