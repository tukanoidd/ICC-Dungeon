/// @desc db_record_destroy(record)
/// @arg {ds_map} record - the ds_map representation of the record to delete

/*
	Deletes a record from its table, based on its ds_map representation.
	The ds_map is also destroyed in the process.
*/

var _record = argument0;
var _table_name = _record[? "_table_name"];
var _table = db_table_load(_table_name);

if(ds_map_exists(_record,"id")) {
	var _id = _record[? "id"];
	db_record_delete(_table,_id);
}

ds_map_destroy(_record);