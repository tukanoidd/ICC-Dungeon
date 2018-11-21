/// @desc db_query_calc(table_or_query,operation,[column])
/// @arg {string} table_name - name of the table
/// @arg {real} operation - calc operation to apply (as defined by the DB_CALC enum)
/// @arg {column} [column] - the column used to perform the operation (if applicable)
/// @returns {ds_map} query

/*
	Prepares and returns a CALC query. When executed, CALC queries, when executed, will perform and return the result of the specified operation 
*/

if(is_string(argument[0])) {
	var _query = _db_query_init(argument[0],DB_QUERY.calc);
}
else {
	var _query = ds_map_create();
	ds_map_copy(_query,argument[0]);
	_query[? "function"] = DB_QUERY.calc;
}

_query[? "calc_op"] = argument[1];

if(argument_count > 2) {
	_query[? "calc_field"] = argument[2];
}

return _query;