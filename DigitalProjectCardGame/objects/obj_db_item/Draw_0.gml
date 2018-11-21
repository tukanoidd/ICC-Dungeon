draw_self();
draw_set_valign(fa_middle);
draw_set_halign(fa_left);

var _hh = sprite_height div 2

switch(type) {

	case OBJ_DB_ITEM_TYPES.label:
		draw_set_font(fnt_db_bold);
		draw_set_color(c_white);
		draw_text(x+8,y + _hh,label);
	break;

	case OBJ_DB_ITEM_TYPES.button:
	draw_set_font(fnt_db_regular);
		draw_set_color(c_black);
		draw_text(x+8,y + _hh,label);
	break;
	
	case OBJ_DB_ITEM_TYPES.list: 
		draw_set_font(fnt_db_regular);
		draw_set_color(c_black);
		draw_text(x+8,y + _hh,label);
		draw_set_halign(fa_right);
		draw_text(x+sprite_width-8,y + _hh,open ? "↑" : "↓");
	break;
	
	case OBJ_DB_ITEM_TYPES.list_item: 
		draw_set_font(fnt_db_regular);
		draw_set_color(c_black);
		draw_text(x+8,y + _hh,"- "+label);
	break;

}