/// @desc db_table_is_loaded(table_name)
/// @arg {string} table_name - name of the table
/// @returns {boolean} true if the table is loaded into memory, false if only present on the file system

/*
	Returns if the table is loaded into memory. Tables will be automatically loaded from the file system
	on the first request, but you can manually do that using db_table_load to avoid the file reading
	overhead afterwards.
*/

var _table_name = argument0;
var _tables = global.db[? "tables"];

return ds_map_exists(_tables,_table_name);