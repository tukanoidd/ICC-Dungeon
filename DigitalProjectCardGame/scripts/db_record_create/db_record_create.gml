/// @desc db_record_create(table_name,[[column,value],..])
/// @arg {string} table_name - name of the table
/// @arg {array} [values[]] - array of column/value pairs
/// @returns {real} the id of the newly created record

/*
	Inserts a new record into the specified table.
	values is an array, where every entry is itself an array with the column name and value.
	Table columns that are not specified in the values array, will get the default value.
	
	The function returns the id of the newly created record.
	
	Example: db_record_create("items",[ ["name","sword"], ["weight",20] ]);
*/

if(is_string(argument[0])) {
	var _table = db_table_load(argument[0]);
}
else {
	var _table = argument[0];
}

var _table_data = _table[? "data"];
var _table_index = _table[? "index"];
var _table_columns = _table[? "columns"];
var _table_column_names = _table[? "column_names"];
var _table_defaults = _table[? "defaults"];
var _column_count = ds_list_size(_table_column_names);

//define row and id
var _row = db_table_size(_table);
var _id = _table_index[| 0]+1;
_table_index[| _id] = _row;
_table_index[| 0] += 1;

//prepare row
if(_table_data < 0) {
    _table_data = ds_grid_create(_column_count,1);
    _table[? "data"] = _table_data;
}
else {
    ds_grid_resize(_table_data,ds_grid_width(_table_data),ds_grid_height(_table_data)+1);
}

//assign defaults
_table_data[# 0,_row] =_id;
for(var _i = 1; _i < _column_count; _i++) {
	var _column_name = _table_column_names[| _i];
	_table_data[# _i,_row] = _table_defaults[? _column_name];
}

//assign values
if(argument_count > 1) {
	var _values = argument[1];
	var _values_count = array_length_1d(_values);
	for(var _i = 0; _i < _values_count; _i++) {
		var _value = _values[_i];
	    var _column = _table_columns[? _value[0]];
	    _table_data[# _column,_row] = _value[1];
	}
}

if(global.db[? "autosave"]) { db_table_save(_table); }

return _id;
