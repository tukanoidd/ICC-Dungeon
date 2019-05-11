//Russia  DB
global.russia_db = ds_map_create();

//Scenario 1
sc1 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", "Make eye contact while answering."); ds_map_add(ans1, "points", 1);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", "Avoid eye contact while answering."); ds_map_add(ans2, "points", 3);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", "Stand up and make eye contact while answering."); ds_map_add(ans3, "points", 2);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", "Stand up and avoid eye contact while answering."); ds_map_add(ans4, "points", 4);

ds_map_add_map(answs, 1, ans1); ds_map_add_map(answs, 2, ans2); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc1, "question", "You go on an exchange to Russia. You want to experience other education system. You go to school. The teacher asks you a question.");
ds_map_add_map(sc1, "answers", answs);
ds_map_add(sc1, "explanation", "In Russia the power distance is high, so it is considered disrespectful to watch the teacher in the eye.");

ds_map_add_map(global.russia_db, 1, sc1);
//Scenario 1

//Scenario 2
sc2 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", "Tell him to relax."); ds_map_add(ans1, "points", 1);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", "Agree with him."); ds_map_add(ans2, "points", 4);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", "Say nothing."); ds_map_add(ans3, "points", 3);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", "Get angry and agree with him."); ds_map_add(ans4, "points", 2);

ds_map_add_map(answs, 1, ans1); ds_map_add_map(answs, 2, ans2); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc2, "question", "You are waiting for a train in a russian train station, and you meet another fellow russian. The guy is getting impatient and angry. What will you tell him?");
ds_map_add_map(sc2, "answers", answs);
ds_map_add(sc2, "explanation", "In Russia, people don’t like it when they are told to do the opposite of what they are doing.");

ds_map_add_map(global.russia_db, 2, sc2);
//Scenario 2

//Scenario 3
sc3 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", "Shake hands."); ds_map_add(ans1, "points", 4);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", "Give 2 kisses on alternating cheeks."); ds_map_add(ans2, "points", 2);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", "Give 3 kisses on alternating cheeks."); ds_map_add(ans3, "points", 1);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", "Hug."); ds_map_add(ans4, "points", 3);

ds_map_add_map(answs, 1, ans1); ds_map_add_map(answs, 2, ans2); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc3, "question", "You travel to Russia and you are about to meet a new girl. You want to have a close relationship in the future. You will go on your first date. How will you greet her?");
ds_map_add_map(sc3, "answers", answs);
ds_map_add(sc3, "explanation", "Russians are quite distant, so a handshake would do best.");

ds_map_add_map(global.russia_db, 3, sc3);
//Scenario 3

//Scenario 4
sc4 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", "Stand up, make an excuse and leave."); ds_map_add(ans1, "points", 2);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", "Stand up and leave."); ds_map_add(ans2, "points", 1);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", "You keep answering his questions."); ds_map_add(ans3, "points", 3);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", "Try to change topics."); ds_map_add(ans4, "points", 4);

ds_map_add_map(answs, 1, ans1); ds_map_add_map(answs, 2, ans2); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc4, "question", "You have a russian friend. He is really curious and asks You a lot of questions related to your family, culture and traditions. After some time, he becomes annoying. What will you do?");
ds_map_add_map(sc4, "answers", answs);
ds_map_add(sc4, "explanation", "In Russia, people are not very assertive so if someone is insisting on a subject you are uncomfortable with trying to change the topic.");

ds_map_add_map(global.russia_db, 4, sc4);
//Scenario 4

//Scenario 5
sc5 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", "Eat it anyway."); ds_map_add(ans1, "points", 2);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", "Tell them that it looks delicious, but it isn't your type of food."); ds_map_add(ans2, "points", 3);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", "Tell them you don't like it."); ds_map_add(ans3, "points", 1);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", "Tell them that it is even better than expected, then continue to avoid eating it."); ds_map_add(ans4, "points", 4);

ds_map_add_map(answs, 1, ans1); ds_map_add_map(answs, 2, ans2); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc5, "question", "You move in to a new house. Next to you there is russian family, who invites you over for dinner. They serve you a Salad, which isn’t your cup of tea. What do you do?");
ds_map_add_map(sc5, "answers", answs);
ds_map_add(sc5, "explanation", "The Russians usually tend to avoid to say their thoughts directly, so it is better to not tell then directly that you don’t like their food.");

ds_map_add_map(global.russia_db, 5, sc5);
//Scenario 5

//Scenario 6
sc6 = ds_map_create();

answs = ds_map_create();

ans1 = ds_map_create(); ds_map_add(ans1, "answer", "Tell him you're angry."); ds_map_add(ans1, "points", 1);
ans2 = ds_map_create(); ds_map_add(ans2, "answer", "Don't get andry and greet him normally."); ds_map_add(ans2, "points", 4);
ans3 = ds_map_create(); ds_map_add(ans3, "answer", "Tell him to be on time next time."); ds_map_add(ans3, "points", 3);
ans4 = ds_map_create(); ds_map_add(ans4, "answer", "Tell him you don't like it when people are late."); ds_map_add(ans4, "points", 2);

ds_map_add_map(answs, 1, ans1); ds_map_add_map(answs, 2, ans2); ds_map_add_map(answs, 3, ans3); ds_map_add_map(answs, 4, ans4);

ds_map_add(sc6, "question", "You are in the capital of Russia. There, you are waiting to meet a russian friend. He’s 30 minutes late. What do you do?");
ds_map_add_map(sc6, "answers", answs);
ds_map_add(sc6, "explanation", "In Russia, it is common for people to be late so they will appreciate if you will not get angry.");

ds_map_add_map(global.russia_db, 6, sc6);
//Scenario 6

//Russia DB