if (room_get_name(room) == "story_start") str = "George was a lonely man, who decided to prove to himself that his passion for archeology was not dead, yet. He had seen the week before an offer for a contest from the Guardian newspaper. They were offering a big prize for the most culturally educated person, who could prove themselves before the jury. The thing was, George did not really have a clue where to start. Thus, he decided to take a walk in the forest, outside the city. There, while just randomly walking and remembering the good old days of discovering ancient culture artifacts and parts of history. Suddenly, he slipped and fell down a hole. The archeologist ended up in a moldy, dark place with dim light, a shabby mind and little to no clue of what was happening.";
else str = "Upon dealing with the final obstacle, George was finally freed from the dim, moldy dungeon. He had proven to himself his self-worth and had decided to act upon the offer from the newspaper. Thus, he took a deep breath of fresh air in and made his first step on the grass field, just outside the hold of darkness and sinister monstrosities.";

stop_draw = false;
i = 0;

convert = ds_map_create();
ds_map_add(convert, true, 15);
ds_map_add(convert, false, 0);