/// @desc db_record_fetch(table,id,[columns[]])
/// @arg {string} table_name - name of the table
/// @arg {real} id - id of the record to fetch
/// @arg [columns[]] - array of column names that will be returned in the record
/// @returns {ds_map|real} a ds_map representation of the record, or -1 if not found

/*
	Returns a ds_map representation of a record, holding the specified columns as keys to access the values.
	If no column names are specified, all columns are returned.
	
	-1 is returned if the record is not found.
*/

if(is_string(argument[0])) {
	var _table = db_table_load(argument[0]);
}
else {
	var _table = argument[0];
}

var _id = argument[1];

if(!db_record_exists(_table,_id)) { return -1; }

if(argument_count > 2) {
	var _records = db_record_fetch_all(_table,[_id],argument[2]);
}
else {
	var _records = db_record_fetch_all(_table,[_id]);
}

if(ds_list_size(_records) > 0) {
	var _record = ds_map_create();
	
	ds_map_copy(_record,_records[| 0]);
	ds_list_destroy(_records);
	
	return _record;
}
else {
	return -1;
}