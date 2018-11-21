/// @desc db_save()
/// @returns {boolean} true if the database could be saved, false the files could not be created

/*
	Saves the currently open database and all of its contents to the file system.
*/

var _db_name = global.db[? "name"];
var _tables = global.db[? "tables"];
var _table_names = global.db[? "table_names"];
var _manifest = global.db[? "manifest"];
var _manifest_table_names = _manifest[? "table_names"];

//if could not find or create the database folder in the file system, exit
if(!_db_open_directory()) { return false; }

//check if manifest needs to be updated / created
if(!db_exists(_db_name) || ds_list_size(_manifest_table_names) != ds_list_size(_table_names)) {
	ds_list_copy(_manifest_table_names,_table_names);
	var _file = file_text_open_write(_db_name + "/" + DB_MANIFEST);
	file_text_write_string(_file,json_encode(_manifest));
	file_text_close(_file);
}

//write table files
for(var _i = 0; _i < ds_list_size(_table_names); _i++) {
	var _table_name = _table_names[| _i];
	if(db_table_is_loaded(_table_name)) {
		var _table = _tables[? _table_name];
		_table[? "persisted"] = true;
		db_table_save(_table);
	}
}

return true;