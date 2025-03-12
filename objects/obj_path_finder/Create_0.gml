// movement along path after path is computed
room_start = global.ML.RoomList[0];
room_goal = global.MR.RoomList[0];

requestRoomPath(room_start, room_goal);

moveToNextRoom();

var startRoom = global.ML.RoomList[0];
var roomHolder = ds_map_find_value(global.room_object_map, room_get_name(startRoom));

if (roomHolder != noone) {
    x = roomHolder.room_x;
    y = roomHolder.room_y;
}

show_debug_message("Pathfinder spawned at x: " + string(x) + " y: " + string(y));
show_debug_message("Starting Room: " + room_get_name(startRoom));