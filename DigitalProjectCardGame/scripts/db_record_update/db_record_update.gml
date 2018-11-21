/// @desc db_record_update(table_name,id,values[])
/// @arg {string} table_name - name of the table
/// @arg {real} id - id of the record to update
/// @arg {array} values[] - array of column/value pairs to update
/// @returns {boolean} true if successful, false if record not found

/*
	Updates the values of the record having the specified in the specified id.
	Values is an array of arrays holding column/value pairs.
	
	Example:	db_record_update("items", item_id, [ ["name","sword"], ["weight",20] ]);
*/


if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _id = argument1;
var _values = argument2;
var _table_data = _table[? "data"];
var _table_index = _table[? "index"];
var _table_columns = _table[? "columns"];

//return if record with id does not exist
if(!db_record_exists(_table,_id)) { return false; }

var _row = _table_index[| _id];

var _values_count = array_length_1d(_values);
for(var _i = 0; _i < _values_count; _i++) {
	var _value = _values[_i];
    var _column = _table_columns[? _value[0]];
    _table_data[# _column,_row] = _value[1];
}

if(global.db[? "autosave"]) { db_table_save(_table); }

return true;