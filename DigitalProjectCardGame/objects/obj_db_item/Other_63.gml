/// @description buttons async callbacks

var _id = ds_map_find_value(async_load, "id");
var _status = ds_map_find_value(async_load, "status");
var _value = ds_map_find_value(async_load, "result");

switch(action) {

	case OBJ_DB_ITEM_ACTIONS.set_query_limit:
		if(!_status) { exit; }
		if(_id == obj_db_explorer.async_events[DB_EXPLORER_ASYNC.set_query_limit]) {
			value = real(_value);
			label = "Limit to: " + string(value);
		}		
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_offset:
		if(!_status) { exit; }
		if(_id == obj_db_explorer.async_events[DB_EXPLORER_ASYNC.set_query_offset]) {
			value = real(_value);
			label = "Offset by: " + string(value);
		}
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_where_value:
		if(_id == obj_db_explorer.async_events[DB_EXPLORER_ASYNC.set_query_where_value]) {
			value = _value;
			label = "is equal to: "+value;
		}
	break;

}