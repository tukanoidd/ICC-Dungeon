if (ev_mouse_enter) sprite_index = exit_button_hover;
else sprite_index = exit_button_idle;

if ((room_get_name(room) == "story_end" && clicked > 0) || room_get_name(room) == "start_menu") game_end();