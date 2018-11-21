/// @desc _db_table_merge(t1,t2,t3_name,foreign_key)
/// @arg t1
/// @arg t2
/// @arg t3_name
/// @arg foreign_key

/*
	INTERNAL USE ONLY!
	merges the contents of two table into a new table based on a foreign key
*/

var _t1 = argument0;
var _t1_name = _t1[? "name"];
var _t1_data = _t1[? "data"];
var _t1_index = _t1[? "index"];
var _t1_columns = _t1[? "columns"];
var _t1_column_names = _t1[? "column_names"];
var _t1_defaults = _t1[? "defaults"];

var _t2 = argument1;
var _t2_name = _t2[? "name"];
var _t2_data = _t2[? "data"];
var _t2_index = _t2[? "index"];
var _t2_columns = _t2[? "columns"];
var _t2_column_names = _t2[? "column_names"];
var _t2_defaults = _t2[? "defaults"];

var _t3_name = argument2;
var _t3 = ds_map_create();
_t3[? "name"] = _t3_name;
if(_t1_data >= 0) {
    var _t3_data = ds_grid_create(ds_map_size(_t1_columns)+ds_map_size(_t2_columns),ds_grid_height(_t1_data));
    ds_grid_clear(_t3_data,undefined);
}
else {
    var _t3_data = -1;
}

var _t3_columns = ds_map_create(); ds_map_add_map(_t3,"columns",_t3_columns);
var _t3_column_names = ds_list_create(); ds_map_add_list(_t3,"column_names",_t3_column_names);
var _t3_defaults = ds_map_create(); ds_map_add_map(_t3,"defaults",_t3_defaults);
var _t3_index = ds_list_create(); ds_map_add_list(_t3,"index",_t3_index);
_t3[? "data"] = _t3_data;


//merge table values
var _t1_width = ds_grid_width(_t1_data);
var _t1_height = ds_grid_height(_t1_data);
var _t2_width = ds_grid_width(_t2_data);
if(_t1_data >= 0) {
    var _foreign_key = _t1_columns[? argument3];
    ds_grid_set_grid_region(_t3_data,_t1_data,0,0,_t1_width-1,_t1_height-1,0,0);
    if(_t2_data >= 0) {
        for(var _t1_row=0; _t1_row<_t1_height; _t1_row+=1) {
            if(db_record_exists(_t2,_t1_data[# _foreign_key,_t1_row])) {
                var _t2_row = _t2_index[| _t1_data[# _foreign_key,_t1_row]];
                ds_grid_set_grid_region(_t3_data,_t2_data,0,_t2_row,_t2_width,_t2_row,_t1_width,_t1_row);
            }
        }
    }
}

//merge column names
var _t1_column_size = ds_list_size(_t1_column_names);
var _t2_column_size = ds_list_size(_t2_column_names);
for(var _i=0;_i<_t1_column_size;_i+=1) {
    var _n = _t1_column_names[| _i];
	var _new_n = _t1_name+"."+_n;
    ds_map_add(_t3_columns,_new_n,_i);
    ds_map_add(_t3_defaults,_new_n,_t1_defaults[? _n]);
	ds_list_add(_t3_column_names,_new_n);
}

for(var _i=0;_i<_t2_column_size;_i+=1) {
    var _n = _t2_column_names[| _i];
	var _new_n = _t2_name+"."+_n;
    ds_map_add(_t3_columns,_new_n,_i+_t1_column_size);
    ds_map_add(_t3_defaults,_new_n,_t2_defaults[? _n]);
	ds_list_add(_t3_column_names,_new_n);
}

//copy index
ds_list_copy(_t3_index,_t1_index);

return _t3;