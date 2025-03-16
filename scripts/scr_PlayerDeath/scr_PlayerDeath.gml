function scr_PlayerDeath(player){
    
    // reset variables
    obj_Player.player_hp = 100;
    obj_Player.falling = false;
    obj_Player.speed_timer = 0;
    obj_Player.item_timer = 0;
    obj_Player.invis_timer = 0;
    obj_Player.image_xscale = 1;
    obj_Player.image_yscale = 1;
    obj_Player.x = 500;
    obj_Player.y = 500;
    
    // remove items
    if (player && obj_Player.wep_held != noone) {
        instance_destroy(obj_Player.wep_held);
    }
    
    // solo / server host goes to Player1Base
    // client player goes to Player2Base
    if (!instance_exists(obj_Client)) {
        room_goto(Player1Base);
    } else {
        room_goto(Player2Base);
    }
    
}