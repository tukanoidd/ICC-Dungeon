/// @desc db_record_find_rand(table_name,amount,unique)
/// @arg {string} table_name - name of the table
/// @arg {real} amount - number of record ids to return
/// @arg {boolean} unique - if true, avoids having duplicate ids in the returned list
/// @returns {ds_list} a ds_list of random record ids

/*
	Returns a ds_list of N record ids, where N is the amount passed as argument.
	If unique is set false, the list may contain duplicate ids. If set to true,
	no duplicate ids will be returned.
*/

if(is_string(argument0)) {
	var _table = db_table_load(argument0);
}
else {
	var _table = argument0;
}

var _amount = argument1;
var _unique = argument2;
var _table_data = _table[? "data"];

if(_table_data < 0) { return -1; } 	

var _ids = ds_list_create();
var _data_height = ds_grid_height(_table_data);

if(_unique) {
	var _temp_list = ds_list_create();
	
	for(var _i = 0; _i < _data_height; _i++) {
		ds_list_add(_temp_list,_table_data[# 0,_i]);
	}
	ds_list_shuffle(_temp_list);
	for(var _i = 0; _i < min(_amount,ds_list_size(_temp_list)); _i++) {
		ds_list_add(_ids,_temp_list[| _i]);
	}
	ds_list_destroy(_temp_list);
}
else {
	repeat(_amount) {
		ds_list_add(_ids,ds_grid_get(_table_data,0,irandom(_data_height-1)));
	}
}
	
return _ids;
	