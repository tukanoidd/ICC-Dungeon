//Netherlands  DB
global.netherlands_db = ds_map_create();

//Scenario 1
sc1 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", ""); ds_map_add(ans1, "points", 0);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", ""); ds_map_add(ans2, "points", 0);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", ""); ds_map_add(ans3, "points", 0);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", ""); ds_map_add(ans4, "points", 0);

ds_map_add_map(answs, 1, ans2); ds_map_add_map(answs, 2, ans3); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc1, "question", "");
ds_map_add_map(sc1, "answers", answs);
ds_map_add(sc1, "explanation", "");

ds_map_add_map(global.netherlands_db, 1, sc1);
//Scenario 1

//Scenario 2
sc2 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", ""); ds_map_add(ans1, "points", 0);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", ""); ds_map_add(ans2, "points", 0);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", ""); ds_map_add(ans3, "points", 0);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", ""); ds_map_add(ans4, "points", 0);

ds_map_add_map(answs, 1, ans2); ds_map_add_map(answs, 2, ans3); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc2, "question", "");
ds_map_add_map(sc2, "answers", answs);
ds_map_add(sc2, "explanation", "");

ds_map_add_map(global.netherlands_db, 2, sc2);
//Scenario 2

//Scenario 3
sc3 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", ""); ds_map_add(ans1, "points", 0);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", ""); ds_map_add(ans2, "points", 0);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", ""); ds_map_add(ans3, "points", 0);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", ""); ds_map_add(ans4, "points", 0);

ds_map_add_map(answs, 1, ans2); ds_map_add_map(answs, 2, ans3); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc3, "question", "");
ds_map_add_map(sc3, "answers", answs);
ds_map_add(sc3, "explanation", "");

ds_map_add_map(global.netherlands_db, 3, sc3);
//Scenario 3

//Scenario 4
sc4 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", ""); ds_map_add(ans1, "points", 0);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", ""); ds_map_add(ans2, "points", 0);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", ""); ds_map_add(ans3, "points", 0);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", ""); ds_map_add(ans4, "points", 0);

ds_map_add_map(answs, 1, ans2); ds_map_add_map(answs, 2, ans3); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc4, "question", "");
ds_map_add_map(sc4, "answers", answs);
ds_map_add(sc4, "explanation", "");

ds_map_add_map(global.netherlands_db, 4, sc4);
//Scenario 4

//Scenario 5
sc5 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", ""); ds_map_add(ans1, "points", 0);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", ""); ds_map_add(ans2, "points", 0);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", ""); ds_map_add(ans3, "points", 0);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", ""); ds_map_add(ans4, "points", 0);

ds_map_add_map(answs, 1, ans2); ds_map_add_map(answs, 2, ans3); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc5, "question", "");
ds_map_add_map(sc5, "answers", answs);
ds_map_add(sc5, "explanation", "");

ds_map_add_map(global.netherlands_db, 5, sc5);
//Scenario 5

//Scenario 6
sc6 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", ""); ds_map_add(ans1, "points", 0);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", ""); ds_map_add(ans2, "points", 0);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", ""); ds_map_add(ans3, "points", 0);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", ""); ds_map_add(ans4, "points", 0);

ds_map_add_map(answs, 1, ans2); ds_map_add_map(answs, 2, ans3); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc6, "question", "");
ds_map_add_map(sc6, "answers", answs);
ds_map_add(sc6, "explanation", "");

ds_map_add_map(global.netherlands_db, 6, sc6);
//Scenario 6

//Netherlands DB