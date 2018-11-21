/// @desc db_close()

/*
	Closes the currently open database (if any), removing all of its data from the program memory, without affecting the
	data saved to the file system.
*/

if(global.db < 0) { exit; }

var _table_names = global.db[? "table_names"];
var _tables = global.db[? "tables"];

var _table_count = ds_list_size(_table_names);
for(var _i = 0; _i < _table_count; _i++) {
	
	var _table_name = _table_names[| _i];
	
	if(db_table_is_loaded(_table_name)) {
		var _table = _tables[? _table_name];
		var _table_data = _table[? "data"];
		if(_table_data >= 0) { ds_grid_destroy(_table_data); }
	}
	
}

ds_map_destroy(global.db);
global.db = -1;