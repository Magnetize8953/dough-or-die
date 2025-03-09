
instance_activate_all(); //method provided via ChatGPT

with (obj_RoomHolder) {
    event_perform(ev_create, 0); //Method provided via ChatGPT to force create events to run
}
	

show_debug_message("Room " + string(room_i) + " generated");

room_i++;
room_holder = room_next(room_holder);
/*
if (room_next(room) != -1) {
	alarm[1] = 10;
    room_goto_next();
}
*/

/*
if (room_exists(room_i)){
	room_goto(room_i);
	alarm[1] = 10;
	*/

if (room_exists(room_holder)) {
	alarm[1] = 5;
	room_goto(room_holder);
	
} else {
	//BM = instance_create_layer(35, -10, "Instances", BMChunk);
	//BR = instance_create_layer(40, -10, "Instances", BRChunk);
	//alarm[0] = 50;
	instance_create_layer(-10, -10, "Instances", obj_MapAssemblerPartB);
}








