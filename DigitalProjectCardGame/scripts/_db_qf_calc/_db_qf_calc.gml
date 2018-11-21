/// @desc _db_qf_update(table,rows,query)
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
var _table_columns = _table[? "columns"];
var _calc_op = ds_map_find_value(_query, "calc_op");
var _calc_field = ds_map_find_value(_query, "calc_field");

//if count, return number of rows found
if(_calc_op == DB_CALC.op_count) {
    return ds_list_size(_rows);
} 

//if no records, return undefined
if(ds_list_empty(_rows)) {
	return undefined;
}

//generate computation grid
var _column = _table_columns[? _calc_field];
var _grid = ds_grid_create(1,ds_list_size(_rows));
for(var _i = 0; _i < ds_list_size(_rows); _i += 1) {
    ds_grid_set(_grid,0,_i,_table_data[# _column,_rows[| _i]]);
}

//perform calc_op
var _result = undefined;
switch(_calc_op) {
    case DB_CALC.op_mean:	_result = ds_grid_get_mean(_grid,0,0,0,ds_grid_height(_grid)-1); break;
    case DB_CALC.op_sum:	_result = ds_grid_get_sum(_grid,0,0,0,ds_grid_height(_grid)-1); break;
    case DB_CALC.op_min:	_result = ds_grid_get_min(_grid,0,0,0,ds_grid_height(_grid)-1); break;
    case DB_CALC.op_max:	_result = ds_grid_get_max(_grid,0,0,0,ds_grid_height(_grid)-1); break;
}

//cleanup and return
ds_grid_destroy(_grid);
return _result;
