if (instance_exists(obj_Client)) {
    if (is_undefined(obj_Client.server_rooms[? "TR"])) {
        alarm[1] = 5;
        return;
    }
}

instance_activate_all(); // Method provided via ChatGPT

with (obj_RoomHolder) {
    event_perform(ev_create, 0); // Method provided via ChatGPT to force create events to run
}

show_debug_message("Room " + string(room_i) + " generated");

room_i++;
room_holder = room_next(room_holder);

if (room_exists(room_holder)) {
	alarm[1] = 5;
	room_goto(room_holder);
	
} else {
	instance_create_layer(-10, -10, "Instances", obj_MapAssemblerPartB);
}