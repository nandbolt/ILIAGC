// Inherit the parent event
event_inherited();

// Saving
itemTypeString = "characters";

/// @func	buyItem();
buyItem = function()
{
	// Set powerup
	with (oPlayer)
	{
		setCharacter(other.itemIdx);
	}
	
	// Unlock
	oGame.myCharacters[itemIdx][1]++;
	itemValue = oGame.myCharacters[itemIdx][1];
	
	// Save current character
	ini_open("save.ini");
	ini_write_real("inventory", "character", itemIdx);
	ini_close();
}