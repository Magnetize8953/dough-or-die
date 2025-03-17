var target;

if (instance_exists(obj_Player)) {
    target = instance_nearest(x, y, obj_Player);

    if (target != noone) {
		var dist = distance_to_object(target);
		
        if (dist > min_dist && dist <= follow_range) {
            path_end();
            direction = point_direction(x, y, target.x, target.y);
            speed = hsp;
        }else{
			path_end();
            speed = 0;
            motion_set(direction, 0);
		}
    }
}
