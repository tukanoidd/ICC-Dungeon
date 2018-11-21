enum DB_EXPLORER_COLORS {
	white,
	ltgray,
	gray,
	dkgray,
	blue
}

enum DB_EXPLORER_ASYNC {
	database_open,
	set_query_limit,
	set_query_offset,
	set_query_where_value,
	size
	
}

enum OBJ_DB_EXPLORER_EVENTS {
	database_open = 0,
	table_load = 1,
	query_run = 2
}

//db variables
db_name = "";
db_tables = -1;

//table variables
table = "";
table_columns = -1;
table_defaults = -1;

//query variables
query_results = -1;
query_limit = -1;
query_offset = -1;
query_sort_column = "";
query_sort_order = "";
query_where_column = "id";
query_where_value = "";

//async events
async_events = array_create(DB_EXPLORER_ASYNC.size);