/// @desc db_open(db_name)
/// @arg {string} db_name - name of the database

/*
	Opens the database with the provided name. db_name is used as database folder name, you may use a path prefix to store the database in
	a specific directory like: db/database_name.
	If the database already exists on the file system, it is loaded. Otherwise a new database is created
*/

var _db_name = argument0;

//if a database is open, close it
if(global.db >= 0) {
    db_close();
}

//create database
global.db = ds_map_create();
global.db[? "name"] = _db_name;
global.db[? "autosave"] = false;
ds_map_add_map(global.db,"tables",ds_map_create());
ds_map_add_list(global.db,"table_names",ds_list_create());

//check if database exists
if(db_exists(_db_name)) {
	
	//load manifest
	var _file = file_text_open_read(_db_name + "/" + DB_MANIFEST);
	var _manifest = json_decode(file_text_read_string(_file));
	file_text_close(_file);
	
	//load table names
	ds_list_copy(global.db[? "table_names"],_manifest[? "table_names"]);

	//add manifest to database
	ds_map_add_map(global.db,"manifest",_manifest);

}
else {
	
	//create manifest
	var _manifest = ds_map_create();
	ds_map_add_list(_manifest,"table_names",ds_list_create());
	ds_map_add_map(global.db,"manifest",_manifest);
	
}