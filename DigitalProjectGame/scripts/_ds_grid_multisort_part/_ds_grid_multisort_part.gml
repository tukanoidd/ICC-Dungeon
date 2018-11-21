/// @desc _ds_grid_multisort_part(grid,args,iteration)
/// @arg grid
/// @arg args
/// @arg iteration

var _grid = argument0;
var _grid_height = ds_grid_height(_grid);
var _grid_width = ds_grid_width(_grid);

var _args = argument1;
var _args_size = array_length_1d(_args);

var _i = argument2;

var _arg = _args[_i];

ds_grid_sort(_grid,_arg[0],_arg[1]);

if(_args_size-1 == _i) { return -1; }

var _col = _arg[0];

var _row_prev = 0;
for(var _row = 1; _row <= _grid_height; _row++) {
    if(_row == _grid_height || _grid[# _col,_row] != _grid[# _col,_row_prev]) {
        if(_row - _row_prev > 1) {
            var _temp_grid = ds_grid_create(_grid_width,_row - _row_prev);
            ds_grid_set_grid_region(_temp_grid,_grid,0,_row_prev,_grid_width-1,_row-1,0,0);
            _ds_grid_multisort_part(_temp_grid,_args,_i+1);
            ds_grid_set_grid_region(_grid,_temp_grid,0,0,_grid_width-1,_row-_row_prev,0,_row_prev);
            ds_grid_destroy(_temp_grid);
        }
        _row_prev = _row;
    }     
}
