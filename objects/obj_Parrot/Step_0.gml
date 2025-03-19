// multiplayer, track other player, host
if (instance_exists(obj_Server)) {
    
    if (!instance_exists(obj_OtherPlayer)) {
        return;
    }
    
    var ml_a = (global.ML.SouthExit == MLaRoom1 && (obj_OtherPlayer.current_room == global.ML.RoomList[0] || obj_OtherPlayer.current_room == global.ML.RoomList[1] || obj_OtherPlayer.current_room == global.ML.RoomList[2] || obj_OtherPlayer.current_room == global.ML.RoomList[3] || obj_OtherPlayer.current_room == global.ML.RoomList[4]));
    var ml_b = (global.ML.SouthExit == MLbRoom3 && (obj_OtherPlayer.current_room == global.ML.RoomList[0] || obj_OtherPlayer.current_room == global.ML.RoomList[1] || obj_OtherPlayer.current_room == global.ML.RoomList[2] || obj_OtherPlayer.current_room == global.ML.RoomList[3]));
    if (ml_a || ml_b) {
        enemy_close = true;
    }
    
} else if (instance_exists(obj_Client)) { // multiplayer, track other player, client
    
    if (!instance_exists(obj_OtherPlayer)) {
        return;
    }
    
    var mr_a = (global.ML.SouthExit == MRaRoom4 && (obj_OtherPlayer.current_room == global.MR.RoomList[0] || obj_OtherPlayer.current_room == global.MR.RoomList[1] || obj_OtherPlayer.current_room == global.MR.RoomList[2] || obj_OtherPlayer.current_room == global.MR.RoomList[3] || obj_OtherPlayer.current_room == global.MR.RoomList[4] || obj_OtherPlayer.current_room == global.MR.RoomList[5]));
    var mr_b = (global.ML.SouthExit == MRbRoom2 && (obj_OtherPlayer.current_room == global.MR.RoomList[0] || obj_OtherPlayer.current_room == global.MR.RoomList[1] || obj_OtherPlayer.current_room == global.MR.RoomList[2] || obj_OtherPlayer.current_room == global.MR.RoomList[3] || obj_OtherPlayer.current_room == global.MR.RoomList[4]));
    if (mr_a || mr_b) {
        enemy_close = true;
    }

} else { // single player, track current position
    
    current_room = room;
    
}