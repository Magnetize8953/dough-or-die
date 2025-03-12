draw_set_halign(fa_left);
draw_set_valign(fa_middle);
draw_text_transformed_color(x, y, option, 0.5, 0.5, 0, text_color, text_color, text_color, text_color, 1);

if (hovering) {
    shader_set(shdr_buttonHighlight);
    shader_set_uniform_f(_uniTime, _time);
    draw_self();
    shader_reset();
}