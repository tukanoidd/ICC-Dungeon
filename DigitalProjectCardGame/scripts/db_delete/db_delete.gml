/// @desc db_delete(db_name)
/// @arg {string} db_name - name of the database to delete

/*
	Deletes a database from the file system. If the database is currently open, it is closed and removed from memory.
*/

var _db_name = argument0;

//if deleting the currently open database, close it
if(global.db >= 0 && global.db[? "name"] == _db_name) {
	db_close();
}

//remove the database files
if(db_exists(_db_name)) {
	directory_destroy(_db_name);
}