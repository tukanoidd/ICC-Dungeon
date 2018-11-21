enum OBJ_DB_ITEM_EVENTS {
	pressed = 0,
	toggle = 1,
	perform_action = 2
}

enum OBJ_DB_ITEM_TYPES {
	label,
	button,
	list,
	list_item = 3
}

enum OBJ_DB_ITEM_ACTIONS {
	open_database,
	load_table,
	set_query_limit,
	set_query_offset,
	set_query_sort_column,
	set_query_sort_order,
	set_query_where_column,
	set_query_where_value
}

image_index = DB_EXPLORER_COLORS.white;
image_speed = 0;
image_yscale = 24;

//generic
type = OBJ_DB_ITEM_TYPES.label;
value = undefined;
label = "";

//button & list
action = -1;

//list specific
options = -1;
open = false;

//list item specific
list = -1;

//async events
async_open_database = -1;
async_set_query_limit = -1;
async_set_query_offset = -1;