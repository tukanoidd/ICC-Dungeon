/// @description init db explorer

//ADAPT WINDOW
var _window_width = round(display_get_width() * 0.9);
var _window_height = round(display_get_height() * 0.8);

room_width = _window_width;
room_height = _window_height

surface_resize(application_surface, _window_width, _window_height);

window_set_size(room_width,room_height);
window_center();

//INIT TOOLBAR
with(obj_db_toolbar) {
	event_user(OBJ_DB_TOOLBAR_EVENTS.init);
}

//INIT RESULT DRAWER
with(obj_db_drawer) {
	event_user(OBJ_DB_DRAWER_EVENTS.init);
}

//OPEN DATABASE
if(db_name != "") {
	event_user(OBJ_DB_EXPLORER_EVENTS.database_open);
}