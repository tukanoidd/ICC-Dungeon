draw_sprite(points_textbox, 0, 0, 1016);
draw_sprite(points_textbox, 0, 0, 952);

draw_set_font(points_font);

draw_set_halign(fa_center);
draw_text_ext(96, 972, "Stage: " + string(global.stage), 20, 152);

draw_set_halign(fa_left);
draw_sprite(coin_spr, -1, 96, 1030);
draw_text(64 - convert[? (global.char_points > 9)], 1036, string(global.char_points) + "x");

draw_set_font(-1);