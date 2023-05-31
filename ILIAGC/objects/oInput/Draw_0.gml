// First player control type
if (!ds_list_empty(playerGamepadIds) && !oGame.tidyUI)
{
	draw_set_alpha(0.5);
	if (os_type == os_android) draw_sprite(sControlTypes, 2, 160, 16);
	else draw_sprite(sControlTypes, clamp(playerGamepadIds[| 0] + 1, 0, 1), 160, 16);
	draw_set_alpha(1);
}