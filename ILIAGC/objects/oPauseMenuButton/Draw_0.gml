// Background
draw_self();

// Name
draw_set_halign(fa_left);
draw_set_valign(fa_top);
draw_text_transformed(x, y, name, 0.5, 0.5, 0);

// Interact
if (selected && !oGame.tidyUI)
{
	// Show press button (jump)
	if (os_type == os_android || !firstPlayerUsingKeyboard()) draw_sprite(sButtonA, 0, x-10, y+5);
	else draw_sprite(sKeySpace, 0, x-24, y+5);
}