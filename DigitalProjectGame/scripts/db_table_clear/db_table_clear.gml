/// @desc db_table_clear(table_name,reset_index)
/// @arg {string} table_name - name of the table to clear
/// @arg {boolean} reset_index - if true, resets also the index to 1

/*
	Removes all the data from a table, without deleting the table structure.
	If reset_index is true, the ids of the newly inserted record will also start again from 1.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _table_data = _table[? "data"];
var _table_index = _table[? "index"];

if(argument1) {
	ds_list_clear(_table_index);
	_table_index[| 0] = 0;
}

if(_table_data >= 0) {
    ds_grid_destroy(_table_data);
    ds_map_replace(_table,"data",-1);
}

if(global.db[? "autosave"]) { db_table_save(_table); }