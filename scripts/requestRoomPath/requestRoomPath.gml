function requestRoomPath(startRoom, goalRoom) {
    global.roomPath = aStarGetRoomPath(startRoom, goalRoom);
    global.roomIndex = 0;
    global.ai_waypoints = [];

    for (var i = 0; i < array_length(global.roomPath); i++) {
        var roomName = global.roomPath[i];
        var roomHolder = ds_map_find_value(global.room_object_map, roomName);
        
        if (roomHolder != noone) {
            var ai_x = roomHolder.room_x;
            var ai_y = roomHolder.room_y;
            array_push(global.ai_waypoints, [x, y]);
        }
    }
}