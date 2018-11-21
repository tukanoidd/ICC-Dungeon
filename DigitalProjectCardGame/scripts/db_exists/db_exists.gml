/// @desc db_exists(db_name)
/// @arg {string} db_name - name of the database
/// @returns {boolean} true if a database with the provided name (and path) exists on the file system

/*
	Checks if a database with the provided name (and path) exists in the file system
*/

var _db_name = argument0;

return file_exists(_db_name + "/" + DB_MANIFEST);