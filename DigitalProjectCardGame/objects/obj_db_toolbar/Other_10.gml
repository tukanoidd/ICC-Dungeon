/// @description init

//ADAPT HEIGHT
image_yscale = room_height - y;

//SCROLLBAR
scrollbar = db_exp_scrollbar_create(x+sprite_width,y,"layer_ui_lv1",16,room_height,true);

//GENERATE ITEMS
event_user(OBJ_DB_TOOLBAR_EVENTS.rebuild_items);