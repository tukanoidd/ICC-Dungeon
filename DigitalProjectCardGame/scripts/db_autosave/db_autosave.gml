/// @desc db_autosave([enabled])
/// @arg {boolean} [enabled]
/// @returns {boolean} true if enabled, false if disabled

/*
	If true or false is provided as argument, enables / disables the autosave feature. 
	If no argument is provided, the current status of the autosave feature is returned.
*/

if(argument_count > 0) {
	global.db[? "autosave"] = argument[0];
	if(argument[0]) { db_save(); }
}

return global.db[? "autosave"];