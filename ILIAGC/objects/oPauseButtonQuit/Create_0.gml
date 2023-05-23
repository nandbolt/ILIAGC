// Inherit the parent event
event_inherited();

// Text
name = "Quit";

// Add neighbors
neighbors[InputAction.UP] = oPauseButtonTidyUI;
neighbors[InputAction.DOWN] = oPauseButtonResume;

/// @func	onPressed();
onPressed = function()
{
	// End game
	game_end();
}