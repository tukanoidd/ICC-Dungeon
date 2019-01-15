if (ev_mouse_enter) sprite_index = restart_button_hover;
else sprite_index = restart_button_idle;

if (clicked > 0) game_restart();