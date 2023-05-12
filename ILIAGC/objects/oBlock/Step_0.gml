// If game started and timer not paused
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Destroy if life timer is zero
	if (lifeTimer <= 0) instance_destroy();
	else lifeTimer--;
}