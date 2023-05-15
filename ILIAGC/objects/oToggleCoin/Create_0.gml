// Inherit the parent event
event_inherited();

// State
active = false;

// Toggle
canToggle = false;
toggledOn = false;

// Overrideable functions
onToggleOn = function(){}
onToggleOff = function(){}

/// @func	toggle();
toggle = function()
{
	// Exit if cant toggle
	if (!canToggle) return;
	
	// Toggle
	toggledOn = !toggledOn;
	
	// Handle correct toggle function
	if (toggledOn) onToggleOn();
	else onToggleOff();
	
	// Toggle sound
	audio_play_sound(sfxCoinCollect, 1, false);
}