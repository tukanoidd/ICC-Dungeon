/// @desc _db_qf_select_ids(table,rows,query)
/// @arg table
/// @arg rows
/// @arg query

/*
	INTERNAL USE ONLY
*/


var _table = argument0;
var _rows = argument1;
var _query = argument2;

var _table_data = _table[? "data"];

var _result = ds_list_create();

for(var _i = 0; _i < ds_list_size(_rows); _i += 1) {
    ds_list_add(_result,_table_data[# 0,_rows[| _i]]);
}
    
return _result;