// Scale canvas if playing on browser
if (os_browser != browser_not_a_browser && (browser_width != canvasWidth || browser_height != canvasHeight))
{
	// Scale canvas
	canvasWidth = min(CANVAS_BASE_WIDTH, browser_width);
	canvasHeight = min(CANVAS_BASE_HEIGHT, browser_height);
	browserScaleCanvas(CANVAS_BASE_WIDTH, CANVAS_BASE_HEIGHT, canvasWidth, canvasHeight, true);
}

// Check pause
if (inputPressed(0, InputAction.START))
{
	// Pause game if not paused
	if (!gamePaused)
	{
		// Create pause menu if one doesn't exist
		if (!instance_exists(oPauseMenu)) instance_create_layer(0, 0, "HUDInstances", oPauseMenu);
		
		// Pause game
		pauseGame();
	}
	else
	{
		// If pause menu exists
		if (instance_exists(oPauseMenu))
		{
			// Destroy pause menu and resume game
			instance_destroy(oPauseMenu);
			resumeGame();
		}
		// Else must have been graphing
		else
		{
			// Toggle grapher off
			with (oGrapher)
			{
				toggleEquationEditor();
			}
		}
	}
}