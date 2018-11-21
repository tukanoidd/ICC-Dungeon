/// @desc db_table_exists(table_name)
/// @arg {string} table_name - name of the table
/// @returns {boolean} returns true if the table exists in the currently open database (regardless if loaded or unloaded), or false otherwise

var _table_names = global.db[? "table_names"];
var _index = ds_list_find_index(_table_names,argument0);

return _index >= 0;
