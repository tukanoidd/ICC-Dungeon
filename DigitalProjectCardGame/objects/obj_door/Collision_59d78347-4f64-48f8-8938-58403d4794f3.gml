if (global.next_level == true) {
	global.next_level = false;
	layer_destroy_instances("Cards");
	card_generator();
}