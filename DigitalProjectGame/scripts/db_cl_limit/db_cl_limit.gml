/// @desc db_cl_limit(query,limit,offset)
/// @arg {ds_map} query - query to apply the clause to
/// @arg {real} limit - maxmimum number of records to affect
/// @arg {real} offset - offset of the resulting records
/// @returns {ds_map} query

/*
	Applies a limit and / or offset clause to the query. Limit will constrain the maximum results of the query to the specified number.
	Offset allows to skip the first N results from the query output.
	
	Setting the limit and / or offset to a number equal to or below 0, will remove that specific clause from the query.
*/
    
var _query = argument0;

if(argument1 <= 0) { ds_map_delete(_query,"limit"); }
else { _query[? "limit"] = argument1; }

if(argument2 <= 0) { ds_map_delete(_query,"offset"); }
else { _query[? "offset"] = argument2; }

return _query;
