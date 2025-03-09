//Health
if instance_exists(obj_Player) then draw_healthbar(8,8,256,32,obj_Player.health,c_black,c_red,c_lime,0,true,true)
//Score
draw_text(16, 64, "Score: "+string(points))