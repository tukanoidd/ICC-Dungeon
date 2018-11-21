/// @desc db_exp_item_create(type,label,value,args...)
/// @arg type
/// @arg label
/// @arg value
/// @arg args...

var _type = argument[0];
var _label = argument[1];

var _item = instance_create_layer(0,0,"layer_ui_lv1",obj_db_item);

var _w = sprite_width;

with(_item) {
	
	type = _type;
	label = _label;
	image_xscale = _w;

	switch(_type) {
		case OBJ_DB_ITEM_TYPES.label: 
			image_index = DB_EXPLORER_COLORS.dkgray;
		break;
	
		case OBJ_DB_ITEM_TYPES.button: 
			value = argument[2];
			action = argument[3];
		break;
	
		case OBJ_DB_ITEM_TYPES.list:
			value = argument[2];
			action = argument[3];
			var _options = argument[4];
			for(var _i=0; _i<array_length_1d(_options); _i++) {
				var _option = _options[_i];
				if(is_array(_option)) {
					options[_i] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list_item,_option[0],_option[1],_item);
				}
				else {
					options[_i] = db_exp_item_create(OBJ_DB_ITEM_TYPES.list_item,_option,_option,_item);
				}
			}
		break;
		
		case OBJ_DB_ITEM_TYPES.list_item:
			value = argument[2];
			list = argument[3];
		break;
	}

}

return _item;