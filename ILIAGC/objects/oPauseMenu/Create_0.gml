// Inherit the parent event
event_inherited();

// Menu
menuLayer = "HUDInstances";

// Buttons
buttonIdx = 0;

// Buttons
var _x = 36, _y = 22 + TILE_SIZE;
var _yoff = TILE_SIZE + 2;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oPauseButtonResume));
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oPauseButtonMusicUp));
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oPauseButtonSFXUp));
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oPauseButtonFullsceen));
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oPauseButtonTidyUI));
_y += _yoff;
if (os_browser == browser_not_a_browser)
{
	array_push(buttons, instance_create_layer(_x, _y, menuLayer, oPauseButtonQuit));
	_y += _yoff;
}