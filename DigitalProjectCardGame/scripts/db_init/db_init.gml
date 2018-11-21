/// @desc db_init()

/*
	Initializes the database system. Should be called only once at game start (ideally in the game start event).
*/

#macro DB_MANIFEST "db.manifest"

enum DB_QUERY {
	select,
	select_ids,
	select_records,
	update,
	delete,
	calc
}

enum DB_CALC {
	op_min,
	op_max,
	op_sum,
	op_count,
	op_mean
}

global.db = -1;