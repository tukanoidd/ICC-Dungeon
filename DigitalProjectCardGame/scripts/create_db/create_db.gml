db_init();
db_open("db");

db_table_create("scenarios", [
	["country", ""], 
	["questions", [
		[1, [
			["question", ""],
			["answers", [
				[1, [
					["answer", ""],
					["points", 0]
				]],
				[2, [
					["answer", ""],
					["points", 0]
				]],
				[3, [
					["answer", ""],
					["points", 0]
				]],
				[4, [
					["answer", ""],
					["points", 0]
				]]
			]]
		]],
		[2, [
			["question", ""],
			["answers", [
				[1, [
					["answer", ""],
					["points", 0]
				]],
				[2, [
					["answer", ""],
					["points", 0]
				]],
				[3, [
					["answer", ""],
					["points", 0]
				]],
				[4, [
					["answer", ""],
					["points", 0]
				]]
			]]
		]],
		[3, [
			["question", ""],
			["answers", [
				[1, [
					["answer", ""],
					["points", 0]
				]],
				[2, [
					["answer", ""],
					["points", 0]
				]],
				[3, [
					["answer", ""],
					["points", 0]
				]],
				[4, [
					["answer", ""],
					["points", 0]
				]]
			]]
		]],
		[4, [
			["question", ""],
			["answers", [
				[1, [
					["answer", ""],
					["points", 0]
				]],
				[2, [
					["answer", ""],
					["points", 0]
				]],
				[3, [
					["answer", ""],
					["points", 0]
				]],
				[4, [
					["answer", ""],
					["points", 0]
				]]
			]]
		]],
	]]]);