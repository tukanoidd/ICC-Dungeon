/// @desc ds_grid_multisort(grid,[[col1,ord1],[col2,ord2],...])
/// @arg grid
/// @arg cols

/*
    Description:    sorts a ds_grid based on multiple columns. Column order determines
                    the priority (high to low)
    Arguments:      grid {ds_grid} : grid to sort
                    [col_N] {real} : column index to sort
                    [col_N_asc] {boolean} : sorts column N ascending (true) or descending (false)
*/

var _grid = argument0;
var _cols = argument1;

_ds_grid_multisort_part(_grid,_cols,0);
