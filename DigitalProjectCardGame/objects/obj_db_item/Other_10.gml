/// @description pressed

switch(type) {

	case OBJ_DB_ITEM_TYPES.label:

	break;

	case OBJ_DB_ITEM_TYPES.button:
		event_user(OBJ_DB_ITEM_EVENTS.perform_action);
	break;
	
	case OBJ_DB_ITEM_TYPES.list: 
		event_user(OBJ_DB_ITEM_EVENTS.toggle);
	break;
	
	case OBJ_DB_ITEM_TYPES.list_item: 
		var _value = value;
		var _label = label;
		with(list) {
			value = _value;
			label = _label;
			event_user(OBJ_DB_ITEM_EVENTS.toggle);
			event_user(OBJ_DB_ITEM_EVENTS.perform_action);
		}
	break;
}