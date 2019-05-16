global.db = ds_map_create();

create_russia_db(); create_netherlands_db(); create_sweden_db(); create_spain_db();

ds_map_add_map(global.db, "russia", global.russia_db);
ds_map_add_map(global.db, "netherlands", global.netherlands_db);
ds_map_add_map(global.db, "sweden", global.sweden_db);
ds_map_add_map(global.db, "spain", global.spain_db);

create_dialogs_db();