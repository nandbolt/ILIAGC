// Inherit the parent event
event_inherited();

// Character
character = -1;

/// @func	onToggleOn();
onToggleOn = function()
{
	// Set character
	setCharacter(character);
	
	// Toggle other coins off
	oToggleCharacterCoin.toggledOn = false;
	
	// Set toggle on
	toggledOn = true;
	
	// Save current character
	ini_open("save.ini");
	ini_write_real("inventory", "character", character);
	ini_close();
}

/// @func	onToggleOff();
onToggleOff = function()
{
	setCharacter(Character.HUMAN);
	with (oToggleCharacterCoin)
	{
		if (character == Character.HUMAN) toggledOn = true;
	}
	
	// Save current character
	ini_open("save.ini");
	ini_write_real("inventory", "character", Character.HUMAN);
	ini_close();
}