/// @description build items

//INIT
var _ode = obj_db_explorer;
var _i = 0;
items = [];

//CLEANUP OLD ITEMS
with(obj_db_item) { instance_destroy(); }

//DATABASE
items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.label,"DATABASE");
if(_ode.db_name == "") {
	items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.button,"Open a database","",OBJ_DB_ITEM_ACTIONS.open_database);
}
else {
	items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.button,_ode.db_name,_ode.db_name,OBJ_DB_ITEM_ACTIONS.open_database);
	
	//TABLE AND QUERY CLAUSES
	if(_ode.table != "") {
		
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.label,"TABLE");
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list,_ode.table,_ode.table,OBJ_DB_ITEM_ACTIONS.load_table,_ode.db_tables);
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.label,"LIMIT / OFFSET");
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.button,"Limit to: "+string(_ode.query_limit),_ode.query_limit,OBJ_DB_ITEM_ACTIONS.set_query_limit);
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.button,"Offset by: "+string(_ode.query_offset),_ode.query_offset,OBJ_DB_ITEM_ACTIONS.set_query_offset);
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.label,"SORT");
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list,_ode.query_sort_column,_ode.query_sort_column,OBJ_DB_ITEM_ACTIONS.set_query_sort_column,_ode.table_columns);
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list,_ode.query_sort_order,_ode.query_sort_order,OBJ_DB_ITEM_ACTIONS.set_query_sort_order,["asc","desc"]);
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.label,"FILTER");
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list,_ode.query_where_column,_ode.query_where_column,OBJ_DB_ITEM_ACTIONS.set_query_where_column,_ode.table_columns);
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.button,"is equal to: (no value)",_ode.query_where_value,OBJ_DB_ITEM_ACTIONS.set_query_where_value);
	}
	else {
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.label,"TABLE");
		items[_i++] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list,"Select a table","",OBJ_DB_ITEM_ACTIONS.load_table,_ode.db_tables);
	}
	
}

//refresh positions
event_user(OBJ_DB_TOOLBAR_EVENTS.refresh_items);