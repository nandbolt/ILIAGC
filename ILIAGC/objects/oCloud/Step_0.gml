// Inherit parent
event_inherited();

// If game active
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// If time to spawn rain
	if (rainTimer >= rainFrequency)
	{
		instance_create_layer(x + random_range(-4, 4), y, "BackgroundInstances", oAcidRain);
		rainTimer = 0;
	}
	else rainTimer++;
}