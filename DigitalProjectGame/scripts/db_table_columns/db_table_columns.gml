/// @desc db_table_columns(table_name)
/// @arg {string} table_name - name of the table
/// @returns {array} array of column names for the specified table

/*
	Returns an array holding the column names of the specified table.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _table_columns = _table[? "column_names"];
var _size = ds_list_size(_table_columns);
var _output = array_create(_size);

for(var _i = 0; _i < _size; _i++) {
	_output[_i] = _table_columns[| _i]; 
}
 
return _output;
