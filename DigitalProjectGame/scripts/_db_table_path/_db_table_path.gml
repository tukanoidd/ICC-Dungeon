/// @desc _db_table_path(table_name)
/// @arg {string} table_name

/*
	INTERNAL USE ONLY!
	given a table name, return the path to the file on the file system
*/

return global.db[? "name"] + "/" + argument0 + ".table";