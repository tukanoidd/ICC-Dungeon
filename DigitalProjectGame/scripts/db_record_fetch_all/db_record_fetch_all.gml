/// @desc db_record_fetch_all(table_name,ids[],[columns[]])
/// @arg {string} table_name - name of the table
/// @arg {ds_list|array} ids[] - ds_list or array of record ids
/// @arg [columns[]] - array of column names that will be returned in each record
/// @returns {ds_list} a ds_list of records, in the form of a ds_map

/*
	Returns a ds_list of records represented as ds_maps. You are in charge of destroying the list after
	usage, this will also destory the record ds_maps automatically.
	
	If no column names are specified, all columns are returned.
*/

if(is_string(argument[0])) {
	var _table = db_table_load(argument[0]);
}
else {
	var _table = argument[0];
}

var _ids = argument[1];
var _table_index = _table[? "index"];

//get column names
if(argument_count > 2) {
	var _column_names = argument[2];
}
else {
	var _column_names = db_table_columns(_table);
}

//get rows
var _rows = ds_list_create();
if(is_array(_ids)) {
	var _ids_size = array_length_1d(_ids);
	for(var _i = 0; _i < _ids_size; _i++) {
		var _id = _ids[_i];
		var _row = _table_index[| _id];
		if(!is_undefined(_row) && _row >= 0) { ds_list_add(_rows,_row); }
	}
}
else {
	var _ids_size = ds_list_size(_ids);
	for(var _i = 0; _i < _ids_size; _i++) {
		var _id = _ids[| _i];
		var _row = _table_index[| _id];
		if(!is_undefined(_row) && _row >= 0) { ds_list_add(_rows,_row); }
	}
}

//fetch records
var _records = _db_records_fetch(_table,_rows,_column_names);
 
ds_list_destroy(_rows);

return _records;