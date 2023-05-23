// Inherit the parent event
event_inherited();

// Text
name = "Music";

// Add neighbors
neighbors[InputAction.UP] = oPauseButtonResume;
neighbors[InputAction.DOWN] = oPauseButtonSFXUp;

/// @func	onPressed();
onPressed = function()
{
	// Audio
	with (oGame)
	{
		// Increase gain
		musicGain += 0.1;
		if (musicGain > 1) musicGain = 0;
		
		// Apply gain
		audio_group_set_gain(audiogroup_music, musicGain, 0);
	}
}