/// @description update

//reset selected rows
ds_list_clear(selected_rows);

//get data
var _grid = obj_db_explorer.query_results;
var _grid_height = _grid < 0 ? 0 : ds_grid_height(_grid);
var _grid_headers = obj_db_explorer.table_columns;

//compute columns width
grid_pixel_sizes = array_create(array_length_1d(_grid_headers));
grid_pixel_height = cell_height * (_grid_height + 1);
grid_pixel_width = 0;
for(var _i = 0; _i < array_length_1d(_grid_headers); _i++) {

	//init size by using column name
	var _col_name = _grid_headers[_i];
	draw_set_font(fnt_db_bold);
	var _size = string_width(string_upper(_col_name));

	//get column size
	draw_set_font(fnt_db_regular);
	for(var _r = 0; _r < _grid_height; _r++){
		_size = min(max(_size,string_width(string(_grid[# _i,_r]))),256);
	}
	
	_size += cell_padding * 2;
	grid_pixel_sizes[_i] = _size;
	grid_pixel_width += _size;

}

//enable / disable scrollbars
scrollbar_y.disabled = grid_pixel_height <= height;
scrollbar_x.disabled = grid_pixel_width <= width;
scrollbar_x.value = 0;
scrollbar_y.value = 0;
x_offset = 0;
y_offset = 0;

//refresh
event_user(OBJ_DB_DRAWER_EVENTS.refresh);