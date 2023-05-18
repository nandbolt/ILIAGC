// Change scope to collectable
with (other)
{
	// Collect if active and not playing soccer
	if (active && oWorld.gameMode != Mode.SOCCER) collect();
}