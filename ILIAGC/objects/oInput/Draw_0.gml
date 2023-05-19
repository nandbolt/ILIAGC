// First player control type
if (!ds_list_empty(playerGamepadIds))
{
	draw_set_alpha(0.5);
	draw_sprite(sControlTypes, clamp(playerGamepadIds[| 0] + 1, 0, 1), 160, 16);
	draw_set_alpha(1);
}