/// @desc _db_query_init(table,function)
/// @arg table
/// @arg function

/*
	INTERNAL USE ONLY
*/

var _query;

_query = ds_map_create();
ds_map_add(_query,"table_name",argument0);
ds_map_add(_query,"function",argument1);

return _query;
