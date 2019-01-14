spd = 50;

global.cards_cliked = 0;

randomize();

global.country = global.countries[irandom_range(0, 3)];
global.scenario = irandom_range(1, 6);

card1 = instance_create_layer(-100, 140, "Cards", obj_card);
with (card1) { target_x = 204; ans_num = 1; move_towards_point(463.75, 140, spd); }

card2 = instance_create_layer(-100, 140, "Cards", obj_card);
with (card2) { target_x = 601; ans_num = 2; move_towards_point(960, 140, spd); }

card3 = instance_create_layer(-100, 140, "Cards", obj_card);
with (card3) { target_x = 998; ans_num = 3; move_towards_point(1456.25, 140, spd); }

card4 = instance_create_layer(-100, 140, "Cards", obj_card);
with (card4) { target_x = 1395; ans_num = 4; move_towards_point(1456.25, 140, spd); }