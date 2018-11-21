/// @desc _db_table_read(file)
/// @arg file

/*
	INTERNAL USE ONLY!
	read the contents and structure of a table from an open file
*/

var _file = argument0;

//load table structure
var _table = json_decode(file_text_read_string(_file));
file_text_readln(_file);
    
//load table data
var _table_data = file_text_read_string(_file);
if(_table_data != "") {
	_table[? "data"] = ds_grid_create(1,1);
	ds_grid_read(_table[? "data"],_table_data);
}
else {
	_table[? "data"] = -1;
}


return _table;