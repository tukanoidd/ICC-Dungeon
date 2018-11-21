/// @desc _db_open_directory()

/*
	INTERNAL USE ONLY!
	Creates the database folder for the currently open database, and returns if successful
*/

var _db_name = global.db[? "name"];

if(!db_exists(_db_name)) {

	//a folder named like the database, but without the database inside, already exists
	if(directory_exists(_db_name)) { return false; }

	//create the database directory
	directory_create(_db_name);
	if(!directory_exists(_db_name)) { return false; }
	
}

return true;