/// @desc db_query_select_records(table,[columns[]])
/// @arg {string} table_name - name of the table
/// @arg {array} [columns[]] - array holding the name of the column data to return
/// @returns {ds_map} query

/*
	Prepares and returns a SELECT_RECORDS query. When executed, SELECT_RECORDS queries return a ds_list of records in the form of a ds_map.
	A record ds_map uses the column names (as specified by the columns argument) as keys to access the column values. It will also always 
	hold the ID column (even if not specified in columns argument) and a special entry, "_table_name" holding the name of its table.
*/

var _query = _db_query_init(argument[0],DB_QUERY.select_records);

if(argument_count > 1) {
	_query[? "select_fields"] = argument[1];
}

return _query;
