/// @description refresh

//init variables
var _grid = obj_db_explorer.query_results;
var _grid_headers = obj_db_explorer.table_columns;

//init surface
if(!surface_exists(grid_canvas)) { grid_canvas = surface_create(width,height); }

//draw
surface_set_target(grid_canvas);
draw_clear(c_white);

var _x = x_offset;
for(var _c = 0; _c < array_length_1d(_grid_headers); _c++){
	var _size = grid_pixel_sizes[_c];
	var _name = string_upper(_grid_headers[_c]);
	db_exp_draw_column(_grid,_name,_c,_size,_x,y_offset);
	_x += _size;
}

surface_reset_target();