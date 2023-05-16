/// @func	setPowerup({int} idx);
function setPowerup(_idx)
{
	// Get object
	var _powerupObject = getPowerupObject(_idx);
	array_push(oWorld.powerups, _powerupObject);
}

/// @func	unsetPowerup({int} idx);
function unsetPowerup(_idx)
{
	// Get object
	var _powerupObject = getPowerupObject(_idx);
	
	// Find powerup location in array
	for (var _i = 0; _i < array_length(oWorld.powerups); _i++)
	{
		// If found powerup
		if (oWorld.powerups[_i] == _powerupObject)
		{
			// Delete from powerup pool
			array_delete(oWorld.powerups, _i, 1);
			break;
		}
	}
}

/// @func	getPowerupName({int} idx);
function getPowerupName(_idx)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			return "Air Jump";
		case Powerup.INVINCIBLE:
			return "Invincible";
		case Powerup.BALL:
			return "Ball";
		case Powerup.IRON_GRAPH:
			return "Iron Graph";
		case Powerup.BLOCK:
			return "Block";
		default:
			return "Shield";
	}
}

/// @func	getPowerupSprite({int} idx);
function getPowerupSprite(_idx)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			return sPowerupAirJump;
		case Powerup.INVINCIBLE:
			return sPowerupInvincible;
		case Powerup.BALL:
			return sPowerupBall;
		case Powerup.IRON_GRAPH:
			return sPowerupIronGraph;
		case Powerup.BLOCK:
			return sPowerupBlock;
		default:
			return sPowerupShield;
	}
}

/// @func	getPowerupCost({int} idx);
function getPowerupCost(_idx)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			return 0;
		case Powerup.INVINCIBLE:
			return 0;
		case Powerup.BALL:
			return 0;
		case Powerup.IRON_GRAPH:
			return 0;
		case Powerup.BLOCK:
			return 0;
		default:
			return 0;
	}
}

/// @func	getPowerupObject({int} idx);
function getPowerupObject(_idx)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			return oPowerupAirJump;
		case Powerup.INVINCIBLE:
			return oPowerupInvincible;
		case Powerup.BALL:
			return oPowerupBall;
		case Powerup.IRON_GRAPH:
			return oPowerupIronGraph;
		case Powerup.BLOCK:
			return oPowerupBlock;
		default:
			return oPowerupShield;
	}
}