/// @desc db_table_delete(table_name)
/// @arg {string} table_name - name of the table to delete

/*
	Deletes a table from the database. Please note that if the table has been saved to the file system,
	the file will ALWAYS be removed as well.
*/

if(is_string(argument0)) {
	var _table_name = argument0;
}
else {
	var _table = argument0;
	var _table_name = _table[? "name"];
}

var _db_name = global.db[? "name"];
var _tables = global.db[? "tables"];
var _table_names = global.db[? "table_names"];
var _manifest = global.db[? "manifest"];
var _manifest_table_names = _manifest[? "table_names"];

//remove the table from the database metadata
var _i = ds_list_find_index(_table_names,_table_name);
if(_i >= 0) { ds_list_delete(_table_names,_i); }

//check if table file exists
var _path = _db_table_path(_table_name);
if(file_exists(_path)) { file_delete(_path); }

//remove from manifest
_i = ds_list_find_index(_manifest_table_names,_table_name);
if(_i >= 0) { 
	ds_list_delete(_manifest_table_names,_i); 
	var _file = file_text_open_write(_db_name + "/" + DB_MANIFEST);
	file_text_write_string(_file,json_encode(_manifest));
	file_text_close(_file);
}

//if loaded, delete from memory
if(db_table_is_loaded(_table_name)) {
	var _table = db_table_load(_table_name);
	var _table_data = _table[? "data"];
	if(_table_data >= 0) { ds_grid_destroy(_table_data); }
	ds_map_destroy(_table);
	ds_map_delete(_tables,_table_name);
}