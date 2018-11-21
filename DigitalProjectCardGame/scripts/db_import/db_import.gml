/// @desc db_import(path,db_name)
/// @arg {string} path - path to the database file
/// @arg {string} db_name - name of the new database to import the data to
/// @returns {boolean} true if imported successfully, false otherwise


/*
	Closes the currently open database, and opens a new one with the provided db_name, importing
	the data from the specified file.
	Please note that db_name has to be a new database, you can't import the data into an existing
	database (in which case, this function returns false)
*/

var _path = argument0;
var _db_name = argument1;

//check if a database with the specified name already exists, or import file is missing
if(db_exists(_db_name) || !file_exists(_path)) { return false; }

//if a database is open, close it
if(global.db >= 0) {
    db_close();
}

//open new database
db_open(_db_name);

//get db data
var _table_names = global.db[? "table_names"];
var _tables = global.db[? "tables"];

//open import file and skip first line
var _file = file_text_open_read(_path);
file_text_readln(_file);

//read tables
while (!file_text_eof(_file)) {
    
	var _table = _db_table_read(_file);
	var _table_name = _table[? "name"];
	_table[? "persisted"] = false;

    ds_map_add_map(_tables,_table_name,_table);
	ds_list_add(_table_names,_table_name);

    file_text_readln(_file);
	
}

//close file and return
file_text_close(_file);

return true;
