/// @desc db_table_save(table_name)
/// @arg {string} table_name - name of the table to save
/// @returns {boolean} true if successful, false otherwise

/*
	Save the table with the provided name to the file system. If the file could not be created, false is returned.
*/

if(is_string(argument0)) {
	var _table_name = argument0;
	if(!db_table_is_loaded(_table_name)) { return true; }
	var _table = db_table_load(_table_name);
}
else {
	var _table = argument0;
	var _table_name = _table[? "name"];
}

var _db_name = global.db[? "name"];
var _manifest = global.db[? "manifest"];
var _manifest_table_names = _manifest[? "table_names"];

//if could not find or create the database in the file system, exit
if(!_db_open_directory()) { return false; }

//export the table to its location
db_table_export(_table,_db_table_path(_table_name));

//check if table is in manifest. If not, update
if(!_table[? "persisted"]) {
	ds_list_add(_manifest_table_names,_table_name);
	var _file = file_text_open_write(_db_name + "/" + DB_MANIFEST);
	file_text_write_string(_file,json_encode(_manifest));
	file_text_close(_file);
	_table[? "persisted"] = true;
}

return true;