/// @desc _db_qf_delete(table,rows,query)
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
var _table_index = _table[? "index"];

ds_list_sort(_rows,true);

var _row, _rid;
for(var _i = 0; _i < ds_list_size(_rows); _i += 1) {
    _row = _rows[| _i] - _i;
    _rid = _table_data[# 0,_row];
	
	if(ds_grid_height(_table_data) == 1) {
        ds_grid_destroy(_table_data);
        ds_map_replace(_table,"data",-1);
    }
	else {
		if(ds_grid_height(_table_data) - 1 != _row) {
			ds_grid_set_grid_region(_table_data,_table_data,0,_row+1,ds_grid_width(_table_data)-1,ds_grid_height(_table_data)-1,0,_row);
		}

		ds_grid_resize(_table_data,ds_grid_width(_table_data),ds_grid_height(_table_data)-1);
	}
	
    _table_index[| _rid] = -1; //set index for the id to -1
}

_db_table_reindex(_table); //reindex to keep track of grid changes

return ds_list_size(_rows);
