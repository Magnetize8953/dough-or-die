draw_text(1700, 10, "Current Room: " + string(room_get_name(self.associated_room)));


shader_set(shdr_WallShader);
shader_set_uniform_f_array(_uniColours, _colours); // pass variable _colours to shader as u_rgb
//shader_set_uniform_f_array(_uniColours, [_colours[0], _colours[1], _colours[2]]);
//shader_set_uniform_f(_uniColours, _colours[0], _colours[1], _colours[2]);

draw_self();
shader_reset();


