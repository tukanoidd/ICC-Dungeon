//remove results
if(query_results >= 0) {
	ds_grid_destroy(query_results);
	query_results = -1;
}