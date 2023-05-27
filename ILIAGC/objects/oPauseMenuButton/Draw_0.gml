// Background
draw_self();

// Name
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(x, y, name, 0.5, 0.5, 0);

// Interact
if (selected && !oGame.tidyUI)
{
	// Show interact key
	if (firstPlayerUsingKeyboard()) draw_sprite(sKeyEnter, 0, x-24, y+5);
	else draw_sprite(sButtonX, 0, x-10, y+5);
}