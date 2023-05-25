// Inherit the parent event
event_inherited();

// Description
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_set_alpha(image_alpha);
drawDescription();
draw_set_alpha(1);

// If not collected
if (!collected && nearbyTimer > 0 && !oGame.tidyUI)
{
	// Show interact key
	if (firstPlayerUsingKeyboard()) draw_sprite(sKeyEnter, 0, x-10, y+9);
	else draw_sprite(sButtonX, 0, x-3.5, y+9);
}