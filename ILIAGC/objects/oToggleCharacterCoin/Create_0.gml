// Inherit the parent event
event_inherited();

// Text
description = "Human";

// Character
character = Character.HUMAN;

/// @func	onToggleOn();
onToggleOn = function()
{
	// Set character
	setCharacter(character);
	
	// Toggle other coins off
	oToggleCharacterCoin.toggledOn = false;
	
	// Set toggle on
	toggledOn = true;
}

/// @func	onToggleOff();
onToggleOff = function()
{
	setCharacter(Character.HUMAN);
	with (oToggleCharacterCoin)
	{
		if (character == Character.HUMAN) toggledOn = true;
	}
}