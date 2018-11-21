/// @desc db_exp_scrollbar_create(x,y,layer,w,h,vertical)
/// @arg x
/// @arg y
/// @arg layer
/// @arg w
/// @arg h
/// @arg vertical

var _x = argument0;
var _y = argument1;
var _layer = argument2;
var _w = argument3;
var _h = argument4;
var _vertical = argument5;

var _scrollbar = instance_create_layer(_x,_y,_layer,obj_db_scrollbar);

with(_scrollbar) {
	image_xscale = _w;
	image_yscale = _h;
	vertical = _vertical;
	event_user(0);
}

return _scrollbar;