/// @desc db_export(filename)
/// @arg {string} filename - path and filename to export the database to
/// @returns {boolean} true if the database could be exported, false otherwise

/*
	Exports the currently open database to a single self-contained database file, that can be
	imported using db_import.
*/

var _filename = argument0;
var _db_name = global.db[? "name"];
var _table_names = global.db[? "table_names"];

//open file
var _file = file_text_open_write(_filename);
if(_file < 0) { return false; }

//write db_name
file_text_write_string(_file,_db_name);

//write tables
for(var _i = 0; _i < ds_list_size(_table_names); _i++) {

	file_text_writeln(_file);

	//get table data
    var _table_name = _table_names[| _i];
    var _table_was_loaded = db_table_is_loaded(_table_name);
	var _table = db_table_load(_table_name);
	
	//write table to file
	_db_table_write(_file, _table);
	
	//reset original state
	if(!_table_was_loaded) { db_table_flush(_table); }

}

file_text_close(_file);

return true;
