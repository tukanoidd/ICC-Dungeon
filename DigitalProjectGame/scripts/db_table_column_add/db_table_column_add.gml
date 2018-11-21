/// @desc db_table_column_add(table_name,column_name,default)
/// @arg {string} table_name - name of the table
/// @arg {string} column_name - name of the column to add
/// @arg {string|real} default - default value (either a string or a number)
/// @returns {boolean} true if successful, false otherwise

/*
	Adds a column to the specified table. If the column already exists, false is returned.
	The default value also determines the type of data held by the column (either strings or real numbers)
*/


if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _column_name = argument1;
var _default = argument2;

var _table_data = _table[? "data"];
var _table_columns = _table[? "columns"];
var _table_column_names = _table[? "column_names"];
var _table_defaults = _table[? "defaults"];

if(!ds_map_exists(_table_columns,_column_name)) {
	
    ds_map_add(_table_columns,_column_name,ds_map_size(_table_columns));
    ds_map_add(_table_defaults,_column_name,_default);
	ds_list_add(_table_column_names,_column_name);
	
    if(_table_data >= 0) {
        ds_grid_resize(_table_data,ds_grid_width(_table_data)+1,ds_grid_height(_table_data));
        ds_grid_set_region(_table_data,ds_grid_width(_table_data)-1,0,ds_grid_width(_table_data)-1,ds_grid_height(_table_data)-1,_default);
    }
    
	if(global.db[? "autosave"]) { db_table_save(_table); }
	
	return true;
	
}
else {
	return false;
}
