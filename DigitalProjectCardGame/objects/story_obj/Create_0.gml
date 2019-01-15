if (room_get_name(room) == "story_start") str = "George was a lonely man, who decided to prove to himself that his passion for archeology was not dead, yet. He had seen the week before an offer for a contest from the Guardian newspaper. They were offering a big prize for the most culturally educated person, who could prove themselves before the jury. The thing was, George did not really have a clue where to start. Thus, he decided to take a walk in the forest, outside the city. There, while just randomly walking and remembering the good old days of discovering ancient culture artifacts and parts of history. Suddenly, he slipped and fell down a hole. The archeologist ended up in a moldy, dark place with dim light, a shabby mind and little to no clue of what was happening.";
else str = "end";

stop_draw = false;
i = 0;

convert = ds_map_create();
ds_map_add(convert, true, 15);
ds_map_add(convert, false, 0);