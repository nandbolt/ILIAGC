// Inherit the parent event
event_inherited();

// Text
name = "Resume";

// Add neighbors
neighbors[InputAction.UP] = oPauseButtonQuit;
neighbors[InputAction.DOWN] = oPauseButtonMusicUp;

/// @func	onPressed();
onPressed = function()
{
	// Game
	with (oGame)
	{
		// Destroy pause menu and resume game
		instance_destroy(oPauseMenu);
		resumeGame();
	}
}