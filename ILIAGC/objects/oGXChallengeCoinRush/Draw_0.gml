// Coin Rush
if (instance_exists(oModeCoin))
{
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	draw_set_color(c_yellow);
	draw_text_transformed(96, 24, "Coin Rush Challenge Active", 0.5, 0.5, 0);
	draw_set_color(c_white);
}