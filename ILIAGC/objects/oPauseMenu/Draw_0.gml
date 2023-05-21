// Paused
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(room_width * 0.5, 24, "Paused", 0.75, 0.75, 0);

// Controls
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _x = room_width * 0.5 + 8, _y = 36 + 7;
var _yoff = 7;
var _s = 0.5;
draw_text_transformed(_x, _y, "Movement Controls", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Move: AD", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Jump: Space", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Interact: Enter", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Crouch: S", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Slide: Move + Crouch", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Down: Crouch + Jump", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, "Hold: Jump (hold)", _s, _s, 0);