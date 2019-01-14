draw_set_halign(fa_left);
draw_set_color(c_white);
draw_set_font(story_font);
draw_text_ext(50, 50, string_copy(str, 0, i), 50, 1820);

if (i < string_length(str)) i += 4;
if (i + 4 > string_length(str)) i = string_length(str);

draw_set_halign(fa_center);
if (i == string_length(str)) draw_text_ext(960, 1034, "Click LMB to proceed...", 50, 1920);