// Inherit the parent event
event_inherited();

// Character
character = Character.HUMAN;

// Saving
itemTypeString = "characters";

/// @func	buyItem();
buyItem = function()
{
	// Set powerup
	with (oPlayer)
	{
		setCharacter(other.character);
	}
	
	// Unlock
	oGame.myCharacters[character][1]++;
	itemValue = oGame.myCharacters[character][1];
	
	// Save current character
	ini_open("save.ini");
	ini_write_real("inventory", "character", character);
	ini_close();
}