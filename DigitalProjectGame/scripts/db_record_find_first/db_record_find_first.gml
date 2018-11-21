/// @desc db_record_find_first(table_name,column,value)
/// @arg {string} table_name - name of the table
/// @arg {string} column - column to match the value against
/// @arg {string|real} value - value to look for in the specified column
/// @returns {real} the record id, or -1 if not found

/*
	Returns the id first record in the table having the specified value in a the specified column.
	If no such record is found, -1 is returned.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _table_data = _table[? "data"];
var _table_columns = _table[? "columns"];
var _column = _table_columns[? argument1];
var _value = argument2;

if(_table_data < 0) { return -1; }
		
if(ds_grid_value_exists(_table_data,_column,0,_column,ds_grid_height(_table_data)-1,_value)) {
	var _row = ds_grid_value_y(_table_data,_column,0,_column,ds_grid_height(_table_data)-1,_value);
	return _table_data[# 0,_row];
}
else {
	return -1;
}