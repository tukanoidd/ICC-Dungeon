var _mouse_over = position_meeting(mouse_x,mouse_y,id);

switch(type) {
	case OBJ_DB_ITEM_TYPES.label:
		
	break;
	
	case OBJ_DB_ITEM_TYPES.button:
		image_index = _mouse_over ? DB_EXPLORER_COLORS.gray : DB_EXPLORER_COLORS.ltgray;
	break;
	
	case OBJ_DB_ITEM_TYPES.list:
		image_index = _mouse_over || open ? DB_EXPLORER_COLORS.gray : DB_EXPLORER_COLORS.ltgray;
	break;
	
	case OBJ_DB_ITEM_TYPES.list_item:
		image_index = _mouse_over ? DB_EXPLORER_COLORS.gray : DB_EXPLORER_COLORS.ltgray;
	break;
}