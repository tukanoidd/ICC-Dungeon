/// @desc db_record_find_value(table_name,id,column)
/// @arg {string} table_name - name of the table
/// @arg {real} id - id of the record
/// @arg {string} column - column to look for
/// @returns {real|string} the value of the record at the specified column

/*
	Returns the value in the specified column of the record with the specified id.
	If the record is not found, the function returns undefined.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _id = argument1;
var _table_data = _table[? "data"];
var _table_columns = _table[? "columns"];
var _table_index = _table[? "index"];
var _column = _table_columns[? argument2];

if(!db_record_exists(_table,_id)) { return undefined; }

var _row = _table_index[| _id];

return _table_data[# _column,_row];