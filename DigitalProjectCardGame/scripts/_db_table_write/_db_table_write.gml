/// @desc _db_table_write(file,table)
/// @arg file
/// @arg table

/*
	INTERNAL USE ONLY!
	writes the contents and structure of a table to an open file
*/

var _file = argument0;
var _table = argument1;
var _table_data = _table[? "data"];
var _table_persisted = _table[? "persisted"];

//write table structure
ds_map_delete(_table,"data");
ds_map_delete(_table,"persisted");
file_text_write_string(_file,json_encode(_table));
file_text_writeln(_file);
    
//write table data
if(_table_data >= 0) {
    file_text_write_string(_file,ds_grid_write(_table_data));
}
   
//reset original state
_table[? "data"] = _table_data;
_table[? "persisted"] = _table_persisted;