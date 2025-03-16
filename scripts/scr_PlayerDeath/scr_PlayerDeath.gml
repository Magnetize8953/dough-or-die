function scr_PlayerDeath(player){
    
    // reset variables
    player.player_hp = 100;
    player.falling = false;
    player.speed_timer = 0;
    player.item_timer = 0;
    player.invis_timer = 0;
    player.image_xscale = 1;
    player.image_yscale = 1;
    player.x = 500;
    player.y = 500;
    
    // remove items
    if (player.wep_held != noone) {
        instance_destroy(player.wep_held);
        player.wep_held = noone;
    }
    
    // solo / server host goes to Player1Base
    // client player goes to Player2Base
    if (!instance_exists(obj_Client)) {
        room_goto(Player1Base);
    } else {
        room_goto(Player2Base);
    }
    
    // just double checking 
    player.player_hp = 100;
    
}