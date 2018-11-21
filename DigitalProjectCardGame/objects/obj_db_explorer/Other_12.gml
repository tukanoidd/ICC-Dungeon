/// @description query_run

//exit of no table is open
if(table == "") { exit; }

//delete old results
if(query_results >= 0) {
	ds_grid_destroy(query_results);
	query_results = -1;
}

//prepare query
var _query = db_query_select(table,table_columns);

//query limit
db_cl_limit(_query,query_limit,query_offset);

//query sort
db_cl_sort(_query,[[query_sort_column,query_sort_order]]);

//query where
var _query_where_op = query_where_value == "" ? -1 : db_op_eq;
var _query_where_value = is_string(table_defaults[? query_where_column]) ? string(query_where_value) : real(query_where_value);
db_cl_where(_query,_query_where_op,[query_where_column],[_query_where_value]);

//query run
var _start_time = get_timer();
query_results = db_query_exec(_query);
show_debug_message("Query execution time: " + string((get_timer() - _start_time) / 1000) + "ms");

//draw results
with(obj_db_drawer) {
	event_user(OBJ_DB_DRAWER_EVENTS.update);
}