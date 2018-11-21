/// @desc db_query_update(table_name,columns[],values[])
/// @arg {string} table_name - name of the table
/// @arg {array} columns[] - array holding the name of the columns to update
/// @arg {array} columns[] - array holding the values to assign to the specified columns
/// @returns {ds_map} query

/*
	Prepares and returns an UPDATE query. When executed, UPDATE queries will change the values of the specified columns
	for ALL the records matched by the query.
	Values and columns have to be passed in separate but matching arrays, where the first value is the one assigned to the first column and so forth.
	UPDATE queries return, when executed, the number of affected records.
*/

var _query = _db_query_init(argument0,DB_QUERY.update);
var _columns = argument1;
var _values = argument2;

if(array_length_1d(_columns) != array_length_1d(_values)) {
    show_error("db_query_update: the number of fields doesn't match the number of values",true);
}

_query[? "update_fields"] = _columns;
_query[? "update_values"] = _values;

return _query;
