/// @description cleanup

//clear surface
if(surface_exists(grid_canvas)) {
	surface_free(grid_canvas);
}

ds_list_destroy(selected_rows);