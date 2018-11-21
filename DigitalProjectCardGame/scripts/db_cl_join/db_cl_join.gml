/// @desc db_cl_join(query,join_table,foreign_key)
/// @arg {ds_map} query - query to apply the clause to
/// @arg {string} join_table - name of the table to join
/// @arg {string} foreign_key - column name on the main table that holds the join table record ids
/// @returns {ds_map} query

/*
	Applies a join clause to the query. Join clauses will merge the contents of the specified join table with the contents of
	the main table specified by the query. The main table has to define a column (identified by the foreign_key argument) 
	holding the ids of the records of the join table.
	
	IMPORTANT: when specifying the column names in SELECT queries that define a join clause, you are required to use the table name. This also
	applies to ANY query clause.
	as a prefix, as in: "main_table.column_name" or "join_table.column_name".
	
	UPDATE and DELETE queries accept join clauses, but the results will be applied only to the main query table. for this reson, UPDATE queries
	are not required, nor should, use the table prefix for the columns to be updated.
	
	Specifying an empty string as join_table, will remove the clause from the query.
*/

var _query  = argument0;

if(argument1 == "") {
	ds_map_delete(_query,"join_table_name");
	ds_map_delete(_query,"join_foreign_key");
}
else {
	_query[? "join_table_name"] = argument1;
	_query[? "join_foreign_key"] = argument2;
}

return _query;
