/// @desc _db_table_reindex(table)
/// @arg table

/*
	INTERNAL USE ONLY!
	recomputes the index of a table
*/

var _table = argument0;
var _table_data = _table[? "data"];
var _table_index = _table[? "index"];

if(_table_data >= 0) {
    for(var _i=0;_i<ds_grid_height(_table_data);_i+=1) {
        var _t_id = _table_data[# 0,_i];
        _table_index[| _t_id] = _i;
    }
}
