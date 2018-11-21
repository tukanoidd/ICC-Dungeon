if(instance_number(object_index) > 1) { instance_destroy(); }

enum OBJ_DB_TOOLBAR_EVENTS {
	init = 0,
	rebuild_items = 1,
	refresh_items = 2
}

//properties
y_offset = 0;
scrollbar = -1;
image_index = DB_EXPLORER_COLORS.ltgray;

//items
items = -1;
items_height = 0;

//async events
async_open_database = [-1,-1];
async_set_query_limit = [-1,-1];
async_set_query_offset = [-1,-1];