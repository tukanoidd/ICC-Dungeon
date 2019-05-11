global.dialog_read = true;
global.next_level = false;
global.stage++;
guard.sprite_index = guardian_eyes_closed;

dr = instance_find(obj_door, 0); dr.sprite_index = door_open;

instance_destroy();