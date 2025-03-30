/// @desc Fade
draw_set_color(#242424);
var _y = lerp(display_get_gui_height(), 0, exp(-4 * (1 - alarm[0] / 60)));
draw_rectangle(0, _y, display_get_gui_width(), display_get_gui_height(), false);
draw_set_color(c_white);