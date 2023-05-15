// Inherit the parent event
event_inherited();

// Character
character = Character.HUMAN;

/// @func	onCollect();
onCollect = function()
{
	// Set powerup
	setCharacter(character);
	
	// Unlock
	oGame.myCharacters[character][1]++;
}