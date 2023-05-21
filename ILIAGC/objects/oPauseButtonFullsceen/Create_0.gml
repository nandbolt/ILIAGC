// Inherit the parent event
event_inherited();

// Text
name = "Fullscreen";

// Add neighbors
neighbors[InputAction.UP] = oPauseButtonSFXUp;
neighbors[InputAction.DOWN] = oPauseButtonQuit;

/// @func	onPressed();
onPressed = function()
{
	// Toggle fullscreen
	window_set_fullscreen(!window_get_fullscreen());
}