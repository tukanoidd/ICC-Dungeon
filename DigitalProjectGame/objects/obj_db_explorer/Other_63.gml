/// @description 

var _id = ds_map_find_value(async_load, "id");
var _status = ds_map_find_value(async_load, "status");
var _value = ds_map_find_value(async_load, "result");

var _event_id = -1;
for(var _e = 0; _e < DB_EXPLORER_ASYNC.size; _e++) {
	if(async_events[_e] == _id) {
		_event_id = _e;
		break;
	}
}

if(_event_id < 0) { exit; }

switch(_event_id) {
	case DB_EXPLORER_ASYNC.database_open: 
		if(!_status) { exit; }
		if(_value != "") {
			db_name = _value;
			event_user(OBJ_DB_EXPLORER_EVENTS.database_open);
		}
	break;
	
	case DB_EXPLORER_ASYNC.set_query_limit:
		if(!_status) { exit; }
		if(_value != "") {
			query_limit = real(_value);
			event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
		}
	break;
	
	case DB_EXPLORER_ASYNC.set_query_offset:
		if(!_status) { exit; }
		if(_value != "") {
			query_offset = real(_value);
			event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
		}
	break;
	
	case DB_EXPLORER_ASYNC.set_query_where_value:
		query_where_value = _value;
		event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
	break;
}