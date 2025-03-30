/// @desc Event
draw_set_color(#242424);
var _a = 1;
if (alarm[0] != -1)
{
	if (playPressed) _a = alarm[0] / 30;
	else _a = 1 - alarm[0] / 30;
}
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_alpha(_a);
draw_sprite_ext(sLogo, 0, camera_get_view_width(view_camera[0]) * 0.5, 40, 0.5, 0.5, 0, c_white, _a);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
var _c = c_white;
if (point_in_rectangle(mouse_x, mouse_y, playButtonX, playButtonY,
	playButtonX + playButtonWidth, playButtonY + playButtonHeight)) _c = c_yellow;
draw_set_color(_c);
draw_sprite_stretched_ext(sBorder, 0, playButtonX, playButtonY, playButtonWidth, playButtonHeight, _c, _a);
draw_text_transformed(playButtonX + playButtonWidth * 0.5, playButtonY + playButtonHeight * 0.5, "Open Calculator", 1, 1, 0);
draw_set_alpha(1);