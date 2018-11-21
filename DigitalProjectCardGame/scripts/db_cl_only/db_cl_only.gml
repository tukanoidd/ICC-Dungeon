/// @desc db_cl_only(query,ids[])
/// @arg {ds_map} query - query to apply the clause to
/// @arg {array|ds_list} ids[] - list or array of ids of records to apply the query to
/// @returns {ds_map} query

/*
	This clause sets lets the query affect only the specified records ids.
	The record ids can be passed as an array or a ds_list. If you choose the latter, you are in charge of
	destroying the ds_list with ds_list_destroy() when appropriate, the query will not do that for you. Since the contents
	of the ds_list are copied though, you are free to destroy it even before the query is executed.
	
	Setting the ids[] argument to -1 removes the clause from the query.
*/

var _query = argument0;
var _ids = argument1;

if(!is_array(_ids)) {
	
	if(_ids < 0) {
		ds_map_delete(_query,"only");
		return _query;
	}
	else {
		var _size = ds_list_size(_ids);
		var _ids_arr = array_create(_size);
		for(var _i=0; _i < _size; _i++) {
			_ids_arr[_i] = _ids[| _i];
		}
	}
	
	_query[? "only"] = _ids_arr;
	
}
else {
	_query[? "only"] = _ids;
}

return _query;
