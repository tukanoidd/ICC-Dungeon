/// @description clear

if(surface_exists(grid_canvas)) {

	surface_set_target(grid_canvas);
	draw_clear(c_white);
	surface_reset_target();

}

grid_pixel_sizes = -1;
grid_pixel_width = 0;
grid_pixel_height = 0;

scrollbar_y.disabled = true;
scrollbar_x.disabled = true;