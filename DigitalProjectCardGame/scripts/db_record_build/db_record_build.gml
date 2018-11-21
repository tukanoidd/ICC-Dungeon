/// @desc db_record_build(table_name,[[column,value],...])
/// @arg {string} table_name - name of the table
/// @arg {array} [values[]] - array of column/value pairs
/// @returns {ds_map} the ds_map representation of the record

/*
	Creates and returns a record representation in the form of a ds_map, without inserting the record into the database
	table.
	
	It is possible to change the properties of the record ds_map to match the column of the table, and afterwards
	actually save the record to the table using db_record_save().
	
	IMPORTANT: You are responsible for destroying the record ds_map. 
	
	Example:	var _record = db_record_build("items",[ ["name","sword"], ["weight",20] ]);
				_record[? "name"] = "my sword";
				db_record_save(_record);
*/

var _table_name = argument[0];

var _record = ds_map_create();
_record[? "_table_name"] = _table_name;

//assign values
if(argument_count > 1) {
	var _values = argument[1];
	var _values_count = array_length_1d(_values);
	for(var _i = 0; _i < _values_count; _i++) {
		var _value = _values[_i];
		_record[? _value[0]] = _value[1];
	}    
}

return _record;
