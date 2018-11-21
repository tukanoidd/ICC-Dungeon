/// @description 

//check scrolling
var _height_diff = max(0,items_height - sprite_height);
var _y_offset = _height_diff * scrollbar.value;

if(_y_offset != y_offset) {
	y_offset = _y_offset;
	event_user(OBJ_DB_TOOLBAR_EVENTS.refresh_items);
}

//check mouse events
if(mouse_check_button_pressed(mb_left)) {
	var _item = instance_position(mouse_x,mouse_y,obj_db_item);
	
	with(_item) {
		event_user(OBJ_DB_ITEM_EVENTS.pressed);
	}
}