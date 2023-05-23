// Inherit the parent event
event_inherited();

// Text
name = "SFXs";

// Add neighbors
neighbors[InputAction.UP] = oPauseButtonMusicUp;
neighbors[InputAction.DOWN] = oPauseButtonFullsceen;

/// @func	onPressed();
onPressed = function()
{
	// Audio
	with (oGame)
	{
		// Increase gain
		sfxGain += 0.1;
		if (sfxGain > 1) sfxGain = 0;
		
		// Apply gain
		audio_group_set_gain(audiogroup_default, sfxGain, 0);
	}
}