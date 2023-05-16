/// @func	setCharacter({int} idx);
function setCharacter(_idx)
{
	// Get object
	var _characterObject = getCharacterObject(_idx);
	var _x = oPlayer.x, _y = oPlayer.y;
	var _velocityX = oPlayer.velocity.x, _velocityY = oPlayer.velocity.y;
	instance_destroy(oPlayer);
	var _character = instance_create_layer(_x, _y, "Instances", _characterObject);
	with (_character)
	{
		velocity.x = _velocityX;
		velocity.y = _velocityY;
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

/// @func	getCharacterSprite({int} idx);
function getCharacterSprite(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return sDogIdle;
		case Character.SLIME:
			return sSlimeIdle;
		default:
			return sPlayerIdle;
	}
}

/// @func	getCharacterCost({int} idx);
function getCharacterCost(_idx)
{
	switch (_idx)
	{
		case Character.DOG:
			return 0;
		case Character.SLIME:
			return 0;
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