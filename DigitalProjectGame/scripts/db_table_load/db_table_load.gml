/// @desc db_table_load(table_name)
/// @arg {string} table_name - name of the table to load

/*
	Loads the specified table from file to the program memory, if not already loaded.
	This is generally done automatically when the table data is needed for the first time,
	but you can use this function for example during a loading process to avoid the file reading overhead
	at a later time.
	
	Note that this function returns a table id (a ds_map) that is used internally, you can use this value to 
	print the table information for debugging purposes, but you should avoid changing the ds_map manually in any way.
*/

var _table_name = argument0;
var _tables = global.db[? "tables"];

if(db_table_is_loaded(_table_name)) {
	return _tables[? _table_name];
}
else {
	var _file = file_text_open_read(_db_table_path(_table_name));
	var _table = _db_table_read(_file);
	file_text_close(_file);

	_table[? "persisted"] = true;
	ds_map_add_map(_tables,_table_name,_table);
	
	return _table;
}