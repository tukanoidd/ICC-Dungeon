country = global.db[? global.country]; 
sc = country[? global.scenario];
q_str = sc[? "question"];
answs = sc[? "answers"]; ans = answs[? ans_num]; ans_str = ans[? "answer"];
points = ans[? "points"];
exp_str = sc[? "explanation"];

draw_set_color(c_black);
draw_set_font(-1);

if (pressed && first_clicked) { 
	draw_set_halign(fa_center);
	draw_set_font(exp_font);
	draw_text_ext(x + 160, y + 61, exp_str + "\n\n" + "You get " + string(points) + " coin" + s[? (points > 1)] + ".", 20, 244);
	draw_set_font(-1);
}

if (x == target_x) {
	draw_set_color(c_white);
	
	draw_set_halign(fa_center);
	draw_sprite_ext(question_textbox, 0, 160, 32, 1, 1, 0, c_white, 0.75);
	draw_text_ext(960, 48, q_str, 20, 1568);
	
	if (position_meeting(mouse_x, mouse_y, self)) draw_sprite_ext(ans_textbox_hover, 0, x, 609, 1, 1, 0, c_white, 0.75);
	else draw_sprite_ext(ans_textbox_idle, 0, x, 609, 1, 1, 0, c_white, 0.75);
	draw_text_ext(x + 159, 638, ans_str, 20, 260);
}