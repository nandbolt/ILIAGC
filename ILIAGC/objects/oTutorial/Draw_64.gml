// Tutorial text
if (!oGame.gamePaused)
{
	draw_set_halign(fa_left);
	draw_set_valign(fa_top);
	draw_text_ext_transformed(20,50,tutorialText,16,196+100,0.5,0.5,0);
}