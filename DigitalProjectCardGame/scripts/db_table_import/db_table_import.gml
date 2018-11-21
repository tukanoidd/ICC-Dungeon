/// @desc db_table_import(path)
/// @arg {string} path - path of the table file
/// @returns {boolean} true if successful, false otherwise

/*
	Imports a table previously saved using db_table_export to the currently open database.
	If the table already exists, this function returns false and the data will not be imported.
*/

var _path = argument0;

//open file
var _file = file_text_open_read(_path);
if(_file < 0) { return false; }

//read table
var _table = _db_table_read(_file);
file_text_close(_file);

//get name
var _table_name = _table[? "name"];

//if table exists, do not import
if(db_table_exists(_table_name)) { 
	var _table_data = _table[? "data"];
	if(_table_data >= 0) { ds_grid_destroy(_table_data); }
	ds_map_destroy(_table);
	
	return false;
}
//add table to master data
else {
	_table[? "persisted"] = false;
	
	ds_map_add_map(global.db[? "tables"],_table_name,_table);
	ds_list_add(global.db[? "table_names"],_table_name);

	return true;
} 