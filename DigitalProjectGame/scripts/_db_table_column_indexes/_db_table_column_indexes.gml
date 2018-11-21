/// @desc _db_table_column_indexes(table,columns[])
/// @arg {string} table_name
/// @arg {array} columns[]

/*
	INTERNAL USE ONLY!
	given an array of column names, returns an array of column indexes
*/

var _table = argument0;
var _columns = argument1;
var _table_columns = _table[? "columns"];

var _column_count = array_length_1d(_columns);
var _indexes = array_create(_column_count);

for(var _i = 0; _i < _column_count; _i += 1) {
	var _name = _columns[_i];
	_indexes[_i] = _table_columns[? _name];
}

return _indexes;