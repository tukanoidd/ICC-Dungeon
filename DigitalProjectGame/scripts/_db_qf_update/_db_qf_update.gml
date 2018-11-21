/// @desc _db_qf_update(table,rows,query)
/// @arg table
/// @arg columns
/// @arg values
/// @arg rows

/*
    INTERNAL USE ONLY
*/

var _table = argument0;
var _rows = argument1;
var _query = argument2;

var _table_data = _table[? "data"];
var _update_fields = ds_map_find_value(_query, "update_fields");
var _update_values = ds_map_find_value(_query, "update_values");
var _columns = _db_table_column_indexes(_table,_update_fields);

var _row;
for(var _i = 0; _i < ds_list_size(_rows); _i+=1) {
    _row = _rows[| _i];
    
	for(var _j = 0; _j < array_length_1d(_columns); _j += 1) {
        var _column = _columns[_j];
        var _value = _update_values[_j];
		
        _table_data[# _column,_row] = _value;
    }
	
}

return ds_list_size(_rows);