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
	draw_set_font(points_font);
	draw_sprite(points_textbox, 0, 864, 50);
	draw_sprite(coin_spr, -1, 964, 65);
	draw_text(943 - convert[? (global.char_points > 9)], 70, string(global.char_points) + "x");
	
	draw_set_font(highscore_font);
	draw_set_halign(fa_center);
	draw_sprite(points_textbox, 0, 864, 118);
	draw_text_ext(960, 136, "Highscore: " + string(hghsc), 20, 172);

	draw_set_font(-1);
	draw_set_halign(fa_center);
}