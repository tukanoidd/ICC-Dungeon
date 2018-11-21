/// @desc db_cl_sort(query,sort_by[])
/// @arg {ds_map} query - query to apply the clause to
/// @arg {array|string} sort_by[] - array contaning the sort parameters
/// @returns {ds_map} query

/*
	This clause tells the query how to sort the results. The sort_by argument is an array where every entry is a sort specification, in order of 
	priority. Each sort specification is also an array, structured as follows:
	
	[column_name,ascending_or_descending,comparison_script]
	
	Where column_name is a string holding the column to be used for sorting, ascending_or_descending is a string holding either "asc" or "desc",
	defining the sort order, and comparison_script is an optional parameter holding a script index that will be applied to the column value before sorting,
	allowing for very customized sort results.
	
	Example1: db_cl_sort(query, [ ["weight", "desc"], ["name", "asc"] ]); //sorts the results first by weight, then by name for records having the same weight
	Example1: db_cl_sort(query, [ ["name", "asc", scr_my_string_length] ]); //sorts the result by the string_length (as defined in the script scr_my_string_length)

	If sort_by is set to -1, the clause will be removed
*/


var _query = argument0;

if(is_string(argument1) && argument1 == "RAND") {
	_query[? "sort"] = "RAND";
}
else if(is_array(argument1) && array_length_1d(argument1) > 0) {
	_query[? "sort"] = argument1;
}
else {
	ds_map_delete(_query,"sort");
}

return _query;