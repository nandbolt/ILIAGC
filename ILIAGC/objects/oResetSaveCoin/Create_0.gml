// Inherit the parent event
event_inherited();

// Text
description = "Reset Save";
longDescription = "WARNING: This will delete your save file, clearing all of your progress. IT WILL ALSO CLOSE THE GAME (to make sure everything is cleared). Only collect if you're sure you want to restart your progress.";

/// @func	onCollect();
onCollect = function()
{
	// Reset save
	resetSave();
}