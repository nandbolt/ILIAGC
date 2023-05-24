// Inherit the parent event
event_inherited();

// Character
character = -1;

/// @func	toggle();
toggle = function()
{
	// Exit if cant toggle
	if (!canToggle) return;
	
	// If collector is first player
	if (collector.playerId == 0)
	{
		// Toggle
		toggledOn = !toggledOn;
	
		// Handle correct toggle function
		if (toggledOn) onToggleOn();
		else onToggleOff();
	}
	// Else change other player's character
	else
	{
		with (collector)
		{
			setCharacter(other.character);
		}
	}
	
	// Toggle sound
	audio_play_sound(sfxCoinCollect, 1, false);
}

/// @func	onToggleOn();
onToggleOn = function()
{
	// Set first player character
	with (collector)
	{
		setCharacter(other.character);
	}
	
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
	// Set character
	with (collector)
	{
		setCharacter(Character.HUMAN);
	}
	
	// Toggle human coin on
	with (oToggleCharacterCoin)
	{
		if (character == Character.HUMAN) toggledOn = true;
	}
		
	// Save current character
	ini_open("save.ini");
	ini_write_real("inventory", "character", Character.HUMAN);
	ini_close();
}