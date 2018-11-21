/// @desc db_table_create(table_name,[[column_name,default],...])
/// @arg {string} table_name - name of the table
/// @arg {array} columns[] - array of arrays holding column names and default values. See example below.
/// @returns {real} -1 if the table already exists and could not be created, or a number >= 0 if successful

/*
	Creates a new table in the current database. Note that the table name is used as filename when saving, avoid special characters not
	compatible with the file system.
	Columns is an array of arrays, that defines the column names and their default value (either a string or a real), determining also
	the column data type.
	
	Example:
	db_table_create("items",[ ["name",""], ["value",0], ["category","no category"] ]);
*/

var _table_name = argument0;
var _columns = argument1;
var _tables = global.db[? "tables"];
var _table_names = global.db[? "table_names"];

//exit if table already exists
if(db_table_exists(_table_name)) {
    return -1;
}

//create structure
var _table = ds_map_create();
_table[? "name"] = _table_name;
_table[? "persisted"] = false;
var _table_data = -1;
var _table_defaults = ds_map_create();
var _table_columns = ds_map_create();
var _table_column_names = ds_list_create();
var _table_index = ds_list_create();
_table_index[| 0] = 0;

//add id column
ds_map_add(_table_columns,"id",0);
ds_map_add(_table_defaults,"id",0);
ds_list_add(_table_column_names,"id");

//setup columns
var _column_count = array_length_1d(_columns);
for(var _i = 0; _i < _column_count; _i++) {
	var _column = _columns[_i];
	var _colname = _column[0];
	if(_colname == "id") { continue; }
    ds_map_add(_table_columns, _colname, _i+1);
    ds_map_add(_table_defaults,_colname,_column[1]);
	ds_list_add(_table_column_names,_colname);
}

//compose table
ds_map_add(_table,"data",-1);
ds_map_add_map(_table,"defaults",_table_defaults);
ds_map_add_map(_table,"columns",_table_columns);
ds_map_add_list(_table,"column_names",_table_column_names);
ds_map_add_list(_table,"index",_table_index);

//add to db structure
ds_map_add_map(_tables,_table_name,_table);
ds_list_add(_table_names,_table_name);

if(global.db[? "autosave"]) { db_table_save(_table); }

return _table;