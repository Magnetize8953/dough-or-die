//Iterate through every room to initialize all room holders
//Made in assistance with ChatGPT for how to iterate through rooms
//Logic is partially original work, partially that of ChatGPT (transforming for loop into Alarm loop)
//https://forum.gamemaker.io/index.php?threads/room-count.51625/
/*
for (room_i = 0; room_exists(room_i); room_i++) {
	room_goto(room_i);
	instance_activate_all(); 
	with (RoomHolder) {
		event_perform(ev_create, 0); //Method provided via ChatGPT to force create events to run
	}
	show_debug_message("Room " + string(room_i) + " generated");
}
*/

room_i = 0; 

room_holder = room;

if (room_exists(room_holder)) {
	room_goto(room_holder);
	alarm[1] = 10;
}


/*
if (room_exists(room_i)) {
	room_goto(room_i);
	//locking down and using alarm to force waiting via ChatGPT
	//instance_deactivate_all(true); 
	alarm[1] = 20;
}
*/


/*
if (room_exists(room_holder)) {
	room_goto(room_holder);
	//locking down and using alarm to force waiting via ChatGPT
	//instance_deactivate_all(true); 
	alarm[1] = 10;
}
*/


//room_goto(room_first);



//TL, TM, TR, ML, C, MR, BL, BM, BR
//Each at +5 from last starting from 0 for x

//BM = instance_create_layer(35, -10, "Instances", BMChunk);
//BR = instance_create_layer(40, -10, "Instances", BRChunk);


//alarm[0] = 50;

/*
if variable_instance_exists(BM.EastExit, "EastConnect") and variable_instance_exists(BR.WestExit, "WestConnect") {
	BM.EastExit.EastConnect = BR.WestExit;
}
*/



/*
if BM.EastExit != noone and BR.WestExit != noone {
	BM.EastExit.EastConnect = BR.WestExit;
	BR.WestExit.WestConnect = BM.EastExit;
}
*/