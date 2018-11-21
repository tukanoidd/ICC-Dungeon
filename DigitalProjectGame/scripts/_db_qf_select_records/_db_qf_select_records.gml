/// @desc _db_qf_select_records(table,rows,query)
/// @arg table
/// @arg rows
/// @arg query

/*
	INTERNAL USE ONLY
*/


var _table = argument0;
var _rows = argument1;
var _query = argument2;

var _column_names = _query[? "select_fields"];

return _db_records_fetch(_table,_rows,_column_names);