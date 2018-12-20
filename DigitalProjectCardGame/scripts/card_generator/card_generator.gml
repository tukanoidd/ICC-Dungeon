spd = 50;

card1 = instance_create_layer(-100, room_height/2 - 225, "Instances", obj_card);
with (card1) { target_x = 303.25; move_towards_point(463.75, room_height/2 - 225, spd); }

card2 = instance_create_layer(-100, room_height/2 - 225, "Instances", obj_card);
with (card2) { target_x = 799.5; move_towards_point(960, room_height/2 - 225, spd); }

card3 = instance_create_layer(-100, room_height/2 - 225, "Instances", obj_card);
with (card3) { target_x = 1295.75; move_towards_point(1456.25, room_height/2 - 225, spd); }