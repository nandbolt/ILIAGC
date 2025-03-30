///	@desc	Load Text
draw_set_color(#242424);
draw_rectangle(0, 0, room_width, room_height, false);
draw_set_color(c_white);
if (alarm[1] != -1 && alarm[1] < 120)
{
	var _a = 1;
	if (alarm[1] > 90) _a = (120 - alarm[1]) / 30;
	else if (alarm[1] < 30) _a = alarm[1] / 30;
	var _w = view_wport[0], _h = view_hport[0];
	var _s = _h / 832 * 4;
	if (os_browser == browser_not_a_browser)
	{
		_w = window_get_width();
		_h = window_get_height();
	}
	draw_sprite_ext(sNb, 0, _w * 0.5, _h * 0.5, _s, _s, 0, c_white, _a);
}
else
{
	if (alarm[1] >= 120) draw_set_alpha(clamp(1 - (180 - alarm[1]) / 30, 0, 1));
	else draw_set_alpha(1);
	var _w = clamp(view_wport[0], 256, 512);
	var _h = _w;
	draw_sprite_stretched(sCmg, 0, (view_wport[0] - _w) * 0.5,
		(view_hport[0] - _h) * 0.5, _w, _h);
	draw_text_ext_transformed(8, 8, loadText, 16, view_wport[0] * 0.25, 3, 3, 0);
	draw_set_alpha(1);
}