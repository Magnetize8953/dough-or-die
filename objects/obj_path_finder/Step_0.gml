if (array_length(global.ai_waypoints) > 0) {
    var target = global.ai_waypoints[0];
    if (is_array(target) && array_length(target) == 2) { 
        var targetX = target[0];
        var targetY = target[1];

        var walk_speed = 4;
        var angle = point_direction(x, y, targetX, targetY);

        x += lengthdir_x(walk_speed, angle);
        y += lengthdir_y(walk_speed, angle);

        if (point_distance(x, y, targetX, targetY) < walk_speed) {
            array_delete(global.ai_waypoints, 0, 1);
        }
    } else {
        show_debug_message("Error: Invalid waypoint format -> " + string(target));
    }
} else {
    show_debug_message("No waypoints available.");
}