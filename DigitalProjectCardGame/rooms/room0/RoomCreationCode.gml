audio_stop_all();

global.countries = ["spain", "russia", "sweden", "netherlands"];
global.char_points = 0;
global.next_level = false;
global.stage = 0;

create_db();

audio_play_sound(background_music_game, 0, true);