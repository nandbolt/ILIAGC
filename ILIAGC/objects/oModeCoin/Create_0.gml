// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Start game
	with (oWorld)
	{
		startGameCoinRush();
	}
	
	// Collect sound
	audio_play_sound(sfxPowerCollect, 1, false);
}