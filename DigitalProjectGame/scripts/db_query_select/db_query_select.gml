/// @desc db_query_select(table_name,columns[])
/// @arg {string} table_name - name of the table
/// @arg {array} columns - array of column names to be returned by the query
/// @returns {ds_map} query

/*
	Prepares and returns a SELECT query. When executed, SELECT queries return a ds_grid of records, holding the values
	of the columns specified as script arguments (in that specific order).
	
	It is worth noting that since ds_grids of size 0 are not allowed in Game Maker, executing a SELECT query that 
	produces no results will return -1 instead of a ds_grid id.
*/

var _query = _db_query_init(argument0,DB_QUERY.select);
_query[? "select_fields"] = argument1;

return _query;

