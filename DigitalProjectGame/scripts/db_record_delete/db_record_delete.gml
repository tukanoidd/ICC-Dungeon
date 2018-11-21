/// @desc db_record_delete(table_name,id)
/// @arg {string} table_name - name of the table
/// @arg {real} id - id of the record to delete
/// @returns {boolean} true if successful, false if record not found

/*
	Deletes the record having the specified id from the table.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _id = argument1;
var _table_data = _table[? "data"];
var _table_index = _table[? "index"];

if(!db_record_exists(_table,_id)) { return false; }

var _row = _table_index[| _id];

if(ds_grid_height(_table_data) == 1) {
	ds_grid_destroy(_table_data);
    ds_map_replace(_table,"data",-1);
}
else {
	if(ds_grid_height(_table_data) - 1 != _row) {
		ds_grid_set_grid_region(_table_data,_table_data,0,_row+1,ds_grid_width(_table_data)-1,ds_grid_height(_table_data)-1,0,_row);
	}
	ds_grid_resize(_table_data,ds_grid_width(_table_data),ds_grid_height(_table_data)-1);
}

_table_index[| _id] = -1;
_db_table_reindex(_table);

if(global.db[? "autosave"]) { db_table_save(_table); }

return true;