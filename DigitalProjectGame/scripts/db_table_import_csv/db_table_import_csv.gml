/// @desc db_table_import_csv(table_name,path)
/// @arg {string} table_name - name of the table where the data needs to be imported to
/// @arg {string} path - path to the CSV file

/*
    Adds the contents of a CSV file into the specified table as new records.
    The first row of the CSV file has to hold the column names in order to match those
	with the table structure. 
	Columns present in the table structure but not in the CSV will get the default value.
	Columns present in the CSV but not in the table will be ignored.
*/

var _table_name = argument0;
var _path = argument1;

var _grid = load_csv(_path);
if(_grid < 0) { return false; }

var _table = db_table_load(_table_name);
var _table_defaults = _table[? "defaults"];
var _grid_height = ds_grid_height(_grid);
var _grid_width = ds_grid_width(_grid);

var _valid_columns = ds_list_create();

//clean up data
for(var _col = 0; _col < _grid_width; _col++ ) {
	var _colname = _grid[# _col,0];
	
	//if column does not exist or column is a string, skip
	if(_colname == "id" || !ds_map_exists(_table_defaults,_colname)) {
		continue;
	}
	
	ds_list_add(_valid_columns,_col);
	
	if(is_real(_table_defaults[? _colname])) {
		for(var _row = 1; _row < _grid_height; _row++ ) {
			_grid[# _col,_row] = real(_grid[# _col,_row]);
		}
	}
}

//create records
var _valid_columns_count = ds_list_size(_valid_columns);
if(_valid_columns_count > 0) {
	var _data = array_create(_valid_columns_count);
	for(var _row = 1; _row < _grid_height; _row++ ) {
		for(var _i = 0; _i < _valid_columns_count; _i++ ) {
			var _col = _valid_columns[| _i];
			var _colname = _grid[# _col,0];
			var _value = _grid[# _col,_row];
			_data[_i] = [_colname,_value];
		}
		db_record_create(_table_name,_data);
	}
}

ds_list_destroy(_valid_columns);
ds_grid_destroy(_grid);

return true;