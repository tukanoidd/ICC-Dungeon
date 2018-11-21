/// @description toggle

open = !open;
with(obj_db_toolbar) { event_user(OBJ_DB_TOOLBAR_EVENTS.refresh_items); }