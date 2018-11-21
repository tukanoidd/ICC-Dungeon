if(instance_number(object_index) > 1) { instance_destroy(); }

enum OBJ_DB_DRAWER_EVENTS {
	init = 0,
	update = 1,
	refresh = 2,
	clear = 3
}

//init general variables
width = 0;
height = 0;

//init scrollbars
scrollbar_x = -1;
scrollbar_y = -1;
x_offset = 0;
y_offset = 0;

//init grid
grid_canvas = -1;

//column size array
grid_pixel_sizes = -1;
grid_pixel_width = 0;
grid_pixel_height = 0;

//grid specs
cell_padding = 8;
cell_height = 24;

//selection
selected_rows = ds_list_create();