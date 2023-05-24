// If nearby
if (nearbyTimer > 0)
{
	// Long description
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	var _x = 22, _y = 36;
	draw_sprite_stretched(sBorder,0,_x-2,_y-1,178-_x-2,32);
	draw_set_color(c_white);
	draw_text_ext_transformed(_x, _y, longDescription, 14, 304, 0.5, 0.5, 0);
}