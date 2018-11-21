/// @desc _db_records_fetch(table,rows,columns[])
/// @arg table
/// @arg rows
/// @arg columns[]

/*
	INTERNAL USE ONLY
*/

var _table = argument0;
var _rows = argument1;
var _column_names = argument2;

var _table_data = _table[? "data"];
var _column_indexes = _db_table_column_indexes(_table,_column_names);

var _records = ds_list_create();

for(var _i = 0; _i < ds_list_size(_rows); _i++) {
    
	var _row = _rows[| _i];
	var _record = ds_map_create();
	
    _record[? "_table_name"] = _table[? "name"];

	var _column_count = array_length_1d(_column_names)
    for(var _j = 0; _j < _column_count; _j++) {
        var _column_name = _column_names[_j];
        var _column_index = _column_indexes[_j];
        _record[? _column_name] = _table_data[# _column_index,_row];
    }
    
    if(!ds_map_exists(_record,"id")) {
		_record[? "id"] = _table_data[# 0,_row];
	}
         
    ds_list_add(_records,_record);
    ds_list_mark_as_map(_records,ds_list_size(_records)-1);
  
}

return _records;
