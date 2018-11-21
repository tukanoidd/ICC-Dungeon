/// @description database_open

//open database
db_open(db_name);

//set db defaults
db_tables = -1;

//get table names
var _table_names = global.db[? "table_names"];
db_tables = array_create(ds_list_size(_table_names));
for(var _i=0; _i<ds_list_size(_table_names); _i++) {
	db_tables[_i] = _table_names[| _i];
}

//reset current table
table = "";
table_columns = -1;
table_defaults = -1;

//delete query results
if(query_results >= 0) {
	ds_grid_destroy(query_results);
	query_results = -1;
}

//refresh toolbar
with(obj_db_toolbar) {
	event_user(OBJ_DB_TOOLBAR_EVENTS.rebuild_items);
}

//clear drawer
with(obj_db_drawer) {
	event_user(OBJ_DB_DRAWER_EVENTS.clear);
}