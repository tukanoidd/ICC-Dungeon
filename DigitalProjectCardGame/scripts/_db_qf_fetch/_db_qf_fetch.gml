/// @desc _db_qf_fetch(table,query);
/// @arg table
/// @arg query

/*
	INTERNAL USE ONLY
*/


//init
var _table = argument0;
var _query = argument1;
var _table_data = _table[? "data"];
var _table_columns = _table[? "columns"];
var _table_index = _table[? "index"];

var _rows = ds_list_create();

//exit if no data found
if(_table_data < 0) { return _rows; }

//init clauses
var _only = ds_map_find_value(_query, "only");
var _where_script = ds_map_exists(_query,"where_script") ? _query[? "where_script"] : -1;

if(!is_undefined(_where_script)) {
	var _where_fields = ds_map_find_value(_query, "where_fields");
	var _where_columns = _db_table_column_indexes(_table,_where_fields);
	var _where_args = ds_map_find_value(_query, "where_args");
	var _where_values = array_create(array_length_1d(_where_columns));
}

var _limit = ds_map_exists(_query,"limit") ? _query[? "limit"] : 0;
var _offset = ds_map_exists(_query,"offset") ? _query[? "offset"] : 0;
var _sort = ds_map_find_value(_query, "sort");

//get row count
var _row_count = is_undefined(_only) ? ds_grid_height(_table_data) : array_length_1d(_only);

//fetch rows
var _row;
for(var _i = 0; _i < _row_count; _i += 1) {
	
	if(is_undefined(_only)) { 
		_row = _i; 
	}
	else {
		_row = ds_list_find_value(_table_index, _only[_i]);
		if(is_undefined(_row) || _row < 0) { continue; }
	}
    
	//apply where clause
    if(_where_script >= 0) {
        for(var _j = 0; _j < array_length_1d(_where_columns); _j += 1) {
			_where_values[_j] = ds_grid_get(_table_data,_where_columns[_j],_row);
        }
        if(!script_execute(_where_script,_where_values,_where_args)) {
			continue; //skip if condition does not match
		}
    }
    
	//add row to list
	if(!is_undefined(_sort)) {
		ds_list_add(_rows,_row);
    }
    else {
		if(_offset > 0) {
			_offset -= 1; 
            continue;
		}
        else {
			ds_list_add(_rows,_row);
            if(_limit > 0 && ds_list_size(_rows) >= _limit) { break; }
		}
	}

}

return _rows;
