// Inherit the parent event
event_inherited();

// Sound
collectSound = sfxPowerCollect;

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update time
		gameTimer += 30;
	}
	
	// Collect sound
	audio_play_sound(sfxPowerCollect, 1, false);
}