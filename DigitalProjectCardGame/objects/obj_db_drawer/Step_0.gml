//check scrollbars offset

var _x_offset = round(scrollbar_x.value * min(0,width - grid_pixel_width));
var _y_offset = round(scrollbar_y.value * min(0,height - grid_pixel_height));

if(_x_offset != x_offset || _y_offset != y_offset ) {
	x_offset = _x_offset;
	y_offset = _y_offset;
	
	event_user(OBJ_DB_DRAWER_EVENTS.refresh);
}

//select rows
if(mouse_check_button_pressed(mb_left) && position_meeting(mouse_x,mouse_y,id)) {
	
	if(point_in_rectangle(mouse_x,mouse_y,x,y,x+grid_pixel_width,y+grid_pixel_height)) {
		var _selected_row = floor((mouse_y - (y + y_offset + cell_height)) / cell_height);
		var _row = selected_rows[| _selected_row];
		selected_rows[| _selected_row] = is_undefined(_row) || _row == 0 ? 1 : 0;
		event_user(OBJ_DB_DRAWER_EVENTS.refresh);
	}
	
}