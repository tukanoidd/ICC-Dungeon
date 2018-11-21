/// @desc db_query_exec(query,[keep])
/// @arg {ds_map} query - the query to exectue
/// @arg {boolean} [keep] - if true, the execution will NOT destroy the query. False by default
/// @returns the query result, depending on the query type being executed

/*
	Executes the specified query and returns its result. Please refer to each query description for the specific return type of every query.
	If a second argument is specified and set to true, the query will not be destroyed by the execution, making it reusable.
*/

//init generic parameters
var _query = argument[0];
var _keep = argument_count > 1 ? argument[1] : false;
var _results = -1;

//init query params
var _table = db_table_load(_query[? "table_name"]);
var _orig_table = _table;
var _function = _query[? "function"];

//join tables
if(ds_map_exists(_query,"join_table_name")) {
	var _join_table = db_table_load(_query[? "join_table_name"]);
	var _join_foreign_key = _query[? "join_foreign_key"];
    _table = _db_table_merge(_table,_join_table,"_jointable_",_join_foreign_key);
}

//fetch affected rows
var _rows = _db_qf_fetch(_table,_query);

//sort
if(ds_map_exists(_query,"sort")) {
    _db_qf_sort(_table,_rows,_query);
}

//handle functions
var _results = -1;
switch(_function) {
    case DB_QUERY.select:
        _results = _db_qf_select(_table,_rows,_query); 
        break;
    case DB_QUERY.select_ids:
        _results = _db_qf_select_ids(_table,_rows,_query); 
        break;
    case DB_QUERY.select_records:
        _results = _db_qf_select_records(_table,_rows,_query); 
        break;
    case DB_QUERY.delete:
        _results = _db_qf_delete(_orig_table,_rows,_query);
		if(_results > 0 && global.db[? "autosave"]) { db_table_save(_orig_table); }
        break;
    case DB_QUERY.update:
        _results = _db_qf_update(_orig_table,_rows,_query);
		if(_results > 0 && global.db[? "autosave"]) { db_table_save(_orig_table); }
        break;
    case DB_QUERY.calc:
        _results = _db_qf_calc(_table,_rows,_query);
        break;
}

//cleanup
if(ds_map_exists(_query,"join_table_name")) {
    if(_table[? "data"] >= 0) {
		ds_grid_destroy(_table[? "data"]);
	}
    ds_map_destroy(_table);
}

ds_list_destroy(_rows); 

if(!_keep) {
    db_query_destroy(_query);
}

//return
return _results;
