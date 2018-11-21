/// @description init

//SET SIZE
width = room_width-x-16;
height = room_height-y-16;
image_xscale = width;
image_yscale = height;

//INIT SCROLLBARS
scrollbar_x = db_exp_scrollbar_create(x,y+height,"layer_ui_lv1",width,16,false);
scrollbar_y = db_exp_scrollbar_create(x+width,y,"layer_ui_lv1",16,height,true);
scrollbar_y.disabled = true;
scrollbar_x.disabled = true;