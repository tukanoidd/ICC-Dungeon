/// @desc db_op_eq(args1[],args2[])
/// @arg args1
/// @arg args2

/*
	Operation to be used in db_cl_where
*/

var _args1 = argument0;
var _args2 = argument1;

for(var _i = 0; _i < array_length_1d(_args1); _i++) {	
	if(_args1[_i] != _args2[_i]) {
		return false;
		break;
	} 
}

return true;