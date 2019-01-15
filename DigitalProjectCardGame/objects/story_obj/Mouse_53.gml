if (i == string_length(str)) {
	if (room_get_name(room) == "story_start") room_goto_next();
	else {
		stop_draw = true;
		instance_create_layer(560, 320, "Instances", restart_button);
		instance_create_layer(560, 640, "Instances", exit_button);
	} 
}

else i = string_length(str);