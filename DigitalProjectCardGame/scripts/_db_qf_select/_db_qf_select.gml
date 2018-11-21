/// @desc _db_qf_select(table,rows,query)
/// @arg table
/// @arg rows
/// @arg query

/*
	INTERNAL USE ONLY
*/


var _table = argument0;
var _rows = argument1;
var _query = argument2;

var _table_data = _table[? "data"];
var _select_fields = ds_map_find_value(_query, "select_fields");

if(ds_list_empty(_rows)) { return -1; }

if(is_undefined(_select_fields)) { //fetch all
    var _data_width = ds_grid_width(_table_data);
    var _result = ds_grid_create(_data_width,ds_list_size(_rows));
    
    for(var _i = 0; _i < ds_list_size(_rows); _i += 1) {
        ds_grid_set_grid_region(_result,_table_data,0,_rows[| _i],_data_width-1,_rows[| _i],0,_i);
    }
}
else { //fetch only requested fields
    var _fields = _db_table_column_indexes(_table,_select_fields);
    _result = ds_grid_create(array_length_1d(_fields),ds_list_size(_rows));
	
    for(var _i = 0; _i < ds_list_size(_rows); _i += 1) {
        for(var _j = 0; _j < array_length_1d(_fields); _j += 1) {
            ds_grid_set(_result,_j,_i,_table_data[# _fields[_j],_rows[| _i]]);
        }
    }

}

return _result;

