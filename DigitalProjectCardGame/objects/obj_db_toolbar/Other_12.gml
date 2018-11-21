/// @description refresh items

var _y = y - y_offset;
var _x = x;
var _height = 0;

for(var _i = 0; _i < array_length_1d(items); _i++) {
	var _item = items[_i];

	with(_item) {
		x = _x;
		y = _y + _height;
		_height += sprite_height;
		
		if(type == OBJ_DB_ITEM_TYPES.list) {
			for(var _o = 0; _o < array_length_1d(options); _o++) {
				var _option = options[_o];
				if(open) {
					instance_activate_object(_option);
					with(_option) {
						x = _x;
						y = _y + _height;
						_height += sprite_height;
					}
				}
				else {
					instance_deactivate_object(_option);
				}
			}
		}
		
	}
}

items_height = _height;

//keep scrollbar at same position
var _height_diff = max(0,items_height - sprite_height);
if(_height_diff == 0) {
	scrollbar.disabled = true;
}
else {
	scrollbar.disabled = false;
	scrollbar.value = y_offset / _height_diff;
}