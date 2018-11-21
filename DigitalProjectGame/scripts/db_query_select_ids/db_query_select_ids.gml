/// @desc db_query_select_ids(table_name)
/// @arg {string} table_name - name of the table
/// @returns {ds_map} query

/*
	Prepares and returns a SELECT_IDS query. When executed, SELECT_IDS queries return a ds_list of record ids.
	If the query execution produces no results, an empty list is returned.
*/

var _query = _db_query_init(argument0,DB_QUERY.select_ids);

return _query;