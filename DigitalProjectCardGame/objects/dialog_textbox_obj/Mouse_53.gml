global.dialog_read = true;
global.next_level = false;
global.stage++;

if (global.stage != 7) card_generator();
instance_destroy();