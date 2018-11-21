/// @desc csv_compose_line(array_or_list,separator)
/// @arg ds_list
/// @arg separator

/*
    Returns a string containing a valid CSV line from the values in a ds_list
    Values are separated by a separator character.
*/
    
var _data = argument0;
var _sep = argument1;

var _output = "";

if(is_array(_data)) {
	var _data_size = array_length_1d(_data);
	for(var _i = 0; _i < _data_size; _i++) {
	    var _value = "\"" + string_replace_all(string(_data[_i]),"\"","\"\"") + "\"";
	    _output += _value;
	
	    if(_i < _data_size-1) {_output += _sep;}    
	}
}
else {
	var _data_size = ds_list_size(_data);
	for(var _i = 0; _i < _data_size; _i++) {
	    var _value = "\"" + string_replace_all(string(_data[| _i]),"\"","\"\"") + "\"";
	    _output += _value;
	
	    if(_i < _data_size-1) {_output += _sep;}    
	}
}

return _output;
