if (!stop_draw) {
	draw_set_halign(fa_left);
	if (room_get_name(room) == "story_end") draw_set_color(c_dkgray);
	else draw_set_color(c_white);
	draw_set_font(story_font);
	draw_text_ext(50, 50, string_copy(str, 0, i), 50, 1820);

	if (i < string_length(str)) i += 4;
	if (i + 4 > string_length(str)) i = string_length(str);

	draw_set_halign(fa_center);
	draw_set_color(c_white);
	if (i == string_length(str)) draw_text_ext(960, 1034, "Click LMB to proceed...", 50, 1920);
}

else {
	draw_set_halign(fa_center);
	
	draw_sprite(question_textbox, 0, 160, 20);
	draw_set_font(end_str_font);
	if (global.char_points < 9) { st = "Maybe you would want to try again!"; draw_set_color(c_red); }
	else if (global.char_points >= 9 && global.char_points < 17) { st = "You did pretty good, but it could also be better."; draw_set_color(c_yellow); }
	else if (global.char_points >= 17 && global.char_points < 24) { st = "You did great!"; draw_set_color(make_color_rgb(21, 249, 17)); }
	else if (global.char_points == 24) { st = "Wow, you got the highest score possible! You're the best!"; draw_set_color(make_color_rgb(21, 249, 17)); }
	draw_text_ext(960, 40, st, 20, 1560);
	
	draw_set_color(c_white);
	draw_set_font(highscore_font);
	draw_sprite(points_textbox, 0, 864, 220);
	draw_text_ext(960, 238, "Highscore: " + string(hghsc), 20, 225);
	
	
	draw_set_font(fa_left);
	
	draw_set_font(points_font);
	draw_sprite(points_textbox, 0, 864, 125);
	draw_sprite(coin_spr, -1, 964, 137);
	draw_text(943 - convert[? (global.char_points > 9)], 142, string(global.char_points) + "x");
	

	draw_set_font(-1);
	draw_set_halign(fa_left);
	draw_set_color(c_white);
}