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
	setCharacter(character);
	
	// Unlock
	oGame.myCharacters[character][1]++;
	itemValue = oGame.myCharacters[character][1];
}