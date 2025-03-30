// Inherit the parent event
event_inherited();

// Text
name = "Tidy UI";

// Add neighbors
neighbors[InputAction.UP] = oPauseButtonSFXUp;
neighbors[InputAction.DOWN] = oPauseButtonQuit;

/// @func	onPressed();
onPressed = function()
{
	// Toggle tidy ui
	oGame.tidyUI = !oGame.tidyUI;
}