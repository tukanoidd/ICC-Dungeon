/// @desc db_record_exists(table_name,id)
/// @arg {string} table_name - name of the table
/// @arg {real} id - id of the record to look for
/// @returns {boolean} true if the record exists, false otherwise

/*
	Checks if the record having the specified id exists in the table.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _id = argument1;
var _table_index = _table[? "index"];

var _row = ds_list_find_value(_table_index,_id);

if(_id > 0 && !is_undefined(_row) && _row > -1) {
	return true;
}
else {
	return false;
}