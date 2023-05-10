// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Change to world scope
	with (oWorld)
	{
		// Update time
		gameTimer += 10;
	}
	
	// Collect sound
	audio_play_sound(sfxPowerCollect, 1, false);
}