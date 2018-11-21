/// @desc db_exp_draw_column(grid,name,column_index,size,x,y)
/// @arg grid
/// @arg name
/// @arg column_index
/// @arg size
/// @arg x
/// @arg y

//get args
var _grid = argument0;
var _col_name = argument1;
var _col_index = argument2;
var _size = argument3;
var _x = argument4;
var _y = argument5;

var _cell_vcenter = cell_height div 2;
var _cell_lpadding = cell_padding div 2;
var _max_height = surface_get_height(grid_canvas);
var _max_width = surface_get_width(grid_canvas);
var _grid_height = _grid < 0 ? 0 : ds_grid_height(_grid);

//base draw setup
draw_set_halign(fa_left);
draw_set_valign(fa_middle);

//draw rows
draw_set_color(c_black);
draw_set_font(fnt_db_regular);
for(var _r = 0; _r < _grid_height; _r++){
	_y += cell_height;
	if(_y <= 0 || _x + _size <= 0 ) { continue; }
	if(_y >= _max_height || _x >= _max_width) { break; }
	var _value = string(_grid[# _col_index,_r]);
	
	var _selected = selected_rows[| _r];
	if(is_undefined(_selected) || _selected == 0) {
		var _sprite_index = _r mod 2 == 0 ? DB_EXPLORER_COLORS.white : DB_EXPLORER_COLORS.ltgray;
	}
	else {
		var _sprite_index = DB_EXPLORER_COLORS.blue;
	}
	draw_sprite_stretched(sprite_index,_sprite_index,_x,_y,_size,cell_height);
	draw_text(_x+_cell_lpadding,_y+_cell_vcenter,_value);
}


//draw headers
draw_set_color(c_white);
draw_set_font(fnt_db_bold);
draw_sprite_stretched(sprite_index,DB_EXPLORER_COLORS.dkgray,_x,0,_size,cell_height);
draw_text(_x+_cell_lpadding,_cell_vcenter,_col_name);