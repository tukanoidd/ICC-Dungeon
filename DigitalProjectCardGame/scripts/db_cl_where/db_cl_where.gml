/// @desc db_cl_where(query,db_op_script,columns[],args[])
/// @arg {ds_map} query - query to apply the clause to
/// @arg {script} db_op_script - comparison script to be used
/// @arg {array} columns[] - array of columns to be passed to the comparison script
/// @arg {array} args[] - array of arguments to be passed to the comparison script
/// @returns {ds_map} query

/*
	Applies a where clause to the query, used to filter the results by applying specific conditions to the column values.
	
	db_op_script is a script index that defines the type of filter to applay (can be either one of the provided db_op_* scripts
	or a custom defined one).
	
	columns is an array of column names to be used to apply the filter.
	
	args is an array of values to be used to match the specified column values against.
	
	Example: db_cl_where(query,db_op_eq,["color"],["red"]) //filters the results to only the records having "Red" as value in the color column.
	
	If -1 is passed as db_op_script argument, the clause is removed from the query.
*/


var _query = argument0;

if(argument1 < 0) {
	ds_map_delete(_query,"where_script");
	ds_map_delete(_query,"where_fields");
	ds_map_delete(_query,"where_args");
}
else {
	_query[? "where_script"] = argument1;
	_query[? "where_fields"] = argument2;
	_query[? "where_args"] = argument3;
}

return _query;