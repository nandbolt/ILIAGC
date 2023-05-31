// Controls
draw_set_alpha(0.75);
draw_sprite_ext(sDPad, 0, 0, display_get_gui_height() - 96, 2.5, 3, 0, c_white, 1);													// DPad
draw_sprite_ext(sFacePad, 0, display_get_gui_width(), display_get_gui_height() - 96, 2.5, 3, 0, c_white, 1);						// FacePad
if (instance_exists(oGrapher) && oGrapher.editingEquation)
{
	draw_sprite_ext(sLeftShoulder, 0, 0, display_get_gui_height() - 96 - 16 - 80, 2.5, 2, 0, c_white, 1);							// LeftShoulder
	draw_sprite_ext(sRightShoulder, 0, display_get_gui_width(), display_get_gui_height() - 96 - 16 - 80, 2.5, 2, 0, c_white, 1);	// RightShoulder
}
draw_set_alpha(1);