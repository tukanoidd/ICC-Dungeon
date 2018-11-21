/// @desc db_table_size(table_name)
/// @arg {string} table_name - name of the table
/// @returns {real} return the number of rows in the specified table

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}


var _table_data = _table[? "data"];

if(_table_data < 0) {
    return 0;
}
else {
    return ds_grid_height(_table_data);
}
