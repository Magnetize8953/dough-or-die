// Sourced from https://manual.gamemaker.io/lts/en/GameMaker_Language/GML_Reference/Drawing/Videos/video_draw.htm
var _data = video_draw(); // process video
var _status = _data[0];

if (_status == 0) {
    var _surface = _data[1];

    draw_surface(_surface, x, y);
}