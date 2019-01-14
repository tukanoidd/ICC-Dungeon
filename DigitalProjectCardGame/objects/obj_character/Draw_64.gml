draw_sprite(points_textbox, 0, 0, 1016);
draw_set_font(points_font);
draw_set_halign(fa_center);
draw_text_ext(96, 1036, "Points: " + string(global.char_points), 20, 152);
draw_set_font(-1);