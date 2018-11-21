/// @desc db_table_flush(table_name)
/// @arg {string} table_name - name of the table to flush

/*
	Flushes (removes) the table from the memory, but does not delete the table file from the file system.
	The table will be loaded automatically on the next request, or by manually calling db_table_load(table_name).
	
	IMPORTANT: if the table has already been saved at least once to the file system, flushing the table WILL NOT SAVE
	the currently unsaved changes, unless you explicitly call db_table_save(table_name) before.
	If instead the table has never been saved, flushing will actually persist the table on the file system.
*/

if(is_string(argument0)) {
	var _table_name = argument0;
	if(!db_table_is_loaded(_table_name)) { exit; }
	var _table = db_table_load(_table_name);
}
else {
	var _table = argument0;
	var _table_name = _table[? "name"];
}

//get table data
var _tables = global.db[? "tables"];
var _table_data = _table[? "data"];

//if table not saved to the file system, save
if(!_table[? "persisted"]) {
	db_table_save(_table);
}

//remove table data
if(_table_data >= 0) {
	ds_grid_destroy(_table_data);
}
	
//destroy table
ds_map_destroy(_table);

//remove from master table map
ds_map_delete(_tables,_table_name);