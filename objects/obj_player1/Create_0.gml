hspeed = 0;
vspeed = 0;
plane_health = 100;
move_speed = 4;

item_name = "";
item_timer = 0; 
speed_timer = 0;

has_weapon = false;
is_invis = false;
weapon = "";
is_attacking = false;
attack_cooldown = 0;

function swing_weapon() {
    if (!has_weapon || weapon != "pizza_cutter") {
        show_debug_message("Swing failed: No weapon equipped!");
        return;
    }

    is_attacking = true;
    attack_cooldown = 30;

    var attack_range = 60;
    var attack_direction = image_angle;

    show_debug_message("Swinging weapon...");

    if (instance_exists(obj_player2)) {
        var hit = instance_place(x + lengthdir_x(attack_range, attack_direction), 
                                 y + lengthdir_y(attack_range, attack_direction), 
                                 obj_player2);

        if (hit != noone) { 
            hit.hp -= 10;

            if (hit.hp <= 0) {
                instance_destroy(hit);
            }
        } else {
            show_debug_message("Missed! No enemy in range.");
        }
    } else {
        show_debug_message("No enemy player exists to attack!");
    }

    sprite_index = spr_pizza_cutter_swing;
    image_index = 0;
}

