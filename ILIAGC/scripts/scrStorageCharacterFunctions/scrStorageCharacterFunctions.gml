/// @func	setCharacter({int} idx);
function setCharacter(_idx)
{
	// Get player info
	var _characterObject = getCharacterObject(_idx);
	var _x = x, _y = y;
	var _velocityX = velocity.x, _velocityY = velocity.y;
	var _playerId = playerId;
	
	// Change to world scope
	with (oWorld)
	{
		// Despawn player
		despawnPlayer(_playerId);
	
		// Spawn in player
		spawnPlayer(_playerId, _characterObject, _x, _y, _velocityX, _velocityY);
	}
}

/// @func	getCharacterName({int} idx);
function getCharacterName(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return "Dog";
		case Character.SLIME:
			return "Slime";
		default:
			return "Human";
	}
}

/// @func	getCharacterSaveName({int} idx);
function getCharacterSaveName(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return "dog";
		case Character.SLIME:
			return "slime";
		default:
			return "human";
	}
}

/// @func	getCharacterDescription({int} idx);
function getCharacterDescription(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return "Character: Ruff ruff!";
		case Character.SLIME:
			return "Character: Slimy, yet satisfying.";
		default:
			return "Character: The root of all evil.";
	}
}

/// @func	getCharacterSprite({int} idx);
function getCharacterSprite(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return sCharacterDog;
		case Character.SLIME:
			return sCharacterSlime;
		default:
			return sCharacterHuman;
	}
}

/// @func	getCharacterCost({int} idx);
function getCharacterCost(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return 150;
		case Character.SLIME:
			return 200;
		default:
			return 0;
	}
}

/// @func	getCharacterObject({int} idx);
function getCharacterObject(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return oPlayerDog;
		case Character.SLIME:
			return oPlayerSlime;
		default:
			return oPlayerHuman;
	}
}