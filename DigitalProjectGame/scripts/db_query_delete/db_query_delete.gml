/// @desc db_query_delete(table_name)
/// @arg {string} table_name - name of the table
/// @returns {ds_map} query

/*
	Prepares and returns a DELETE query. DELETE queries whe exectued delete all the records matched by the provided clauses.
	If not clauses are provided, all records will be deleted. It is worth noting that if you want to delete ALL the records in a table,
	db_table_clear is the preferred and most efficient way to do it.
	
	DELETE queries return, when executed, the number of affected records.
*/

var _query = _db_query_init(argument0,DB_QUERY.delete);

return _query;

