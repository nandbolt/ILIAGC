// Increment draw counter
if (drawCounter < drawTime) drawCounter++;

// If game started and timer not paused
if (oWorld.gameStarted && !oWorld.gameTimerPaused)
{
	// Iron graph timer
	if (ironGraphTimer > 0) ironGraphTimer--;
	else molten = false;
}