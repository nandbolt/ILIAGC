// Inherit the parent event
event_inherited();

// Text
description = "Reset Save";

/// @func	onCollect();
onCollect = function()
{
	// Reset save
	resetSave();
	
	// Load unlockables
	with (oGame)
	{
		loadUnlockables();
	}
	
	// Restart room
	room_restart();
}