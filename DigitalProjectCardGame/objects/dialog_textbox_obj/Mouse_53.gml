global.dialog_read = true;
global.next_level = false;
global.stage++;
guard.sprite_index = guardian_eyes_closed;

if (global.stage != 7) card_generator();
instance_destroy();