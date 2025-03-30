// Start
if (keyboard_check_pressed(vk_anykey) && alarm[0] == -1) pressPlay();

// Mouse
if (mouse_check_button_pressed(mb_left) &&
	point_in_rectangle(mouse_x, mouse_y, playButtonX, playButtonY,
	playButtonX + playButtonWidth, playButtonY + playButtonHeight)) pressPlay();