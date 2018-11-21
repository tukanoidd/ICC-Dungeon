/// @desc db_table_column_remove(table_name,column_name)
/// @arg {string} table_name - name of the table
/// @arg {string} column_name - name of the column to remove

/*
	Removes a column from the specified table, as well as all the data held in that column.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _table_data = _table[? "data"];
var _table_columns = _table[? "columns"];
var _table_column_names = _table[? "column_names"];
var _table_defaults = _table[? "defaults"];
var _column_name = argument1;
var _column_index = _table_columns[? _column_name];

if(ds_map_exists(_table_columns,_column_name)) {
    if(_table_data >= 0) {
        if(ds_grid_width(_table_data)-1 != _column_index) {
            ds_grid_set_grid_region(_table_data,_table_data,_column_index+1,0,_column_index+1,ds_grid_height(_table_data)-1,_column_index,0);
        }
        ds_grid_resize(_table_data,ds_grid_width(_table_data)-1,ds_grid_height(_table_data));
    }
    ds_map_delete(_table_columns,_column_name);
    ds_map_delete(_table_defaults,_column_name);
	ds_list_delete(_table_column_names,ds_list_find_index(_table_column_names,_column_name));

    //reindex columns
	var _column_count = ds_list_size(_table_column_names);
    for(var _i = 0; _i < _column_count; _i++) {
        _table_columns[? _table_column_names[| _i]] = _i;
    }
	
	if(global.db[? "autosave"]) { db_table_save(_table); }
	
}
