/// @desc db_table_export_csv(table_name,path,separator)
/// @arg {string} table_name - name of the table to export
/// @arg {string} path - path to export to
/// @arg {string} separator - separator character
/// @returns {boolean} true if successful, false otherwise

/*
    Exports the table to a CSV file at the specified path/filename.
    Fields are separated by the separator character (usually ",").
*/

var _table = db_table_load(argument0);
var _table_data = _table[? "data"];
var _table_column_names = _table[? "column_names"];
var _column_count = ds_list_size(_table_column_names);

var _path = argument1;
var _sep = argument2;

var _csv = file_text_open_write(_path);
if(_csv < 0) { return false; }

//write column names
file_text_write_string(_csv,csv_compose_line(_table_column_names,_sep));

//write data if present
if(_table_data >= 0) {
	var _rows_count = ds_grid_height(_table_data);
	var _row_data = array_create(_column_count);

	for(var _row = 0; _row < _rows_count; _row += 1) {
		for(var _col = 0; _col < _column_count; _col += 1) {
	        _row_data[_col] = _table_data[# _col,_row];   
	    }
		
		file_text_writeln(_csv);
		file_text_write_string(_csv,csv_compose_line(_row_data,_sep));
	}
}
	
//close and return
file_text_close(_csv);
return true;