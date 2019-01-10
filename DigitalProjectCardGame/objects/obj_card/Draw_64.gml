country = global.db[? global.country]; 
sc = country[? global.scenario];
q_str = sc[? "question"];
answs = sc[? "answers"]; ans = answs[? 1]; ans_str = ans[? "answer"];
points = ans[? "points"];
exp_str = sc[? "explanation"];

draw_set_color(c_black);

if (pressed && first_clicked) { 
	draw_set_halign(fa_center);
	draw_text_ext(x + 160, y + 61, exp_str, 20, 244);
}

else {

}