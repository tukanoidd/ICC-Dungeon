str = global.dialogs_db[? global.stage];

char = instance_find(obj_character, 0);

guard = instance_find(guardian_obj, 0);
guard.sprite_index = guardian_eyes_open;

char.x = guard.x - 60;