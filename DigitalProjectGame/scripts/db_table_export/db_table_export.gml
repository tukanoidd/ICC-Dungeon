/// @desc db_table_export(table_name,path)
/// @arg {string} table_name - name of the table to export
/// @arg {string} path - path to export the table to
/// @returns {boolean} true if successful

/*
	Exports a table to file to the specified path. The table can be imported back by using db_table_import
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _path = argument1;

var _file = file_text_open_write(_path);

if(_file < 0) { return false; }

_db_table_write(_file,_table);
file_text_close(_file);

return true;