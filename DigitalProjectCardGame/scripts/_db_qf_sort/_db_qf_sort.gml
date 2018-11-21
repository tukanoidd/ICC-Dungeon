/// @desc _db_qf_sort(table,rows,query)
/// @arg table
/// @arg rows
/// @arg query

/*
	INTERNAL USE ONLY
*/


//init params
var _table = argument0;
var _rows = argument1;
var _query = argument2;
var _args = _query[? "sort"];

//if no rows to sort, exit
if(ds_list_empty(argument1)) { exit; }

//init query params
var _limit = ds_map_exists(_query,"limit") ? _query[? "limit"] : 0;
var _offset = ds_map_exists(_query,"offset") ? _query[? "offset"] : 0;

//check if random order
if(is_string(_args) && _args == "RAND") {
    
	ds_list_shuffle(_rows);
    
	if(_limit > 0 || _offset > 0) {
        var _new_rows = ds_list_create();
		var _bottom = _offset;
        var _top = min(_limit+_offset,ds_list_size(_rows));
        for(var _i = _bottom; _i < _top; _i += 1) {
            _new_rows[| _i] = _rows[| _i];
        }
        ds_list_copy(_rows,_new_rows);
        ds_list_destroy(_new_rows);
    }
	
    exit;
}

//init sort
var _table_data = _table[? "data"];
var _table_columns = _table[? "columns"];
var _sort_count = array_length_1d(_args);

/*

	_args: [["colname","asc"],["colname","desc",script]]

*/

//create sortable row grid
var _grid = ds_grid_create(_sort_count+1,ds_list_size(_rows));

//parse params
var _sort = array_create(_sort_count);
var _cols = array_create(_sort_count);
var _scripts = array_create(_sort_count);
for(var _i = 0; _i < _sort_count; _i += 1) {
	var _arg = _args[_i];
	
	//set col index
	_cols[_i] = _table_columns[? _arg[0]];

	//set order arguments
	var _ord = _arg[1] != "desc";
	_sort[_i] = [_i+1,_ord];
	
	//set script
	_scripts[_i] = array_length_1d(_arg) > 2 ? _arg[2] : -1;
}


//fill grid
var _row_count = ds_list_size(_rows);
for(var _i = 0; _i < _row_count; _i += 1) {
	var _row = _rows[| _i];
    ds_grid_set(_grid, 0, _i, _row);
	
    for(var _j = 0; _j < _sort_count; _j += 1) {
		var _col = _cols[_j];
		var _script = _scripts[_j];
		var _val = _script < 0 ? _table_data[# _col, _row] : script_execute(_script,_table_data[# _col, _row]);
        ds_grid_set(_grid, _j + 1, _i, _val);
    }
}


//sort grid
ds_grid_multisort(_grid,_sort);

//reset rows list and apply limit and offset
ds_list_clear(_rows);
var _top = _limit > 0 ? min(_limit+_offset,ds_grid_height(_grid)) : ds_grid_height(_grid);

for(var _i = _offset; _i < _top; _i+=1) {
    ds_list_add(_rows,_grid[# 0,_i]);
}

//cleanup
ds_grid_destroy(_grid);

