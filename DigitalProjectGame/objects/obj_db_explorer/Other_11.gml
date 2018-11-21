/// @description table_load

//flush tables
for(var _t = 0; _t < array_length_1d(db_tables); _t++) {
	db_table_flush(db_tables[_t]);
}

//get table columns
var _table = db_table_load(table);
table_columns = db_table_columns(table);
table_defaults = _table[? "defaults"];

//reset query params
query_limit = 50;
query_offset = 0;
query_sort_column = "id";
query_sort_order = "asc";
query_where_column = "id";
query_where_value = "";

//update toolbar
with(obj_db_toolbar) {
	event_user(OBJ_DB_TOOLBAR_EVENTS.rebuild_items); 
}

//run query
event_user(OBJ_DB_EXPLORER_EVENTS.query_run);
