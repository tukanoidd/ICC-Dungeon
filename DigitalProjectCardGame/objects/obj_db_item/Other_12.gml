/// @description perform_action

var _value = value;

switch(action) {
	case OBJ_DB_ITEM_ACTIONS.open_database:
		with(obj_db_explorer) {
			async_events[DB_EXPLORER_ASYNC.database_open] = get_string_async("Name of the database to open","db_demo");
		}
	break;
	
	case OBJ_DB_ITEM_ACTIONS.load_table:
		with(obj_db_explorer) { 
			table = _value;
			event_user(OBJ_DB_EXPLORER_EVENTS.table_load); 
		}
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_limit:
		with(obj_db_explorer) {
			async_events[DB_EXPLORER_ASYNC.set_query_limit] = get_string_async("Limit results to:","");	
		}	
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_offset:
		with(obj_db_explorer) {
			async_events[DB_EXPLORER_ASYNC.set_query_offset] = get_string_async("Offset results by:","");
		}
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_sort_column:
		with(obj_db_explorer) { 
			query_sort_column = _value;
			event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
		}	
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_sort_order:
		with(obj_db_explorer) { 
			query_sort_order = _value;
			event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
		}	
	break;
	
	case OBJ_DB_ITEM_ACTIONS.set_query_where_column:
		with(obj_db_explorer) { 
			query_where_column = _value;
			event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
		}	
	break;
	
	
	case OBJ_DB_ITEM_ACTIONS.set_query_where_value:
		with(obj_db_explorer) {
			async_events[DB_EXPLORER_ASYNC.set_query_where_value] = get_string_async("Search the selected column for:","");
		}
	break;
	
	
}
