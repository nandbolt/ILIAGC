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

/// @func	getPowerupName({int} idx, {int} lvl);
function getPowerupName(_idx, _lvl)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			if (_lvl == 3) return "Aerodynamics";
			else if (_lvl == 2) return "Vacuum Chamber";
			return "Booster Pack";
		case Powerup.INVINCIBLE:
			if (_lvl == 3) return "Ball of Sunshine";
			else if (_lvl == 2) return "Slow Fusion";
			return "Star Power";
		case Powerup.BALL:
			if (_lvl == 3) return "Ghost Ball";
			else if (_lvl == 2) return "Spherical Purity";
			return "Ball";
		case Powerup.IRON_GRAPH:
			if (_lvl == 3) return "Molten Graphs";
			else if (_lvl == 2) return "Special Alloy";
			return "Iron Graphs";
		case Powerup.BLOCK:
			if (_lvl == 3) return "Auto Vaults";
			else if (_lvl == 2) return "Builder Buff";
			return "Block";
		default:
			if (_lvl == 3) return "Red Formula";
			else if (_lvl == 2) return "Green Formula";
			return "Bubble";
	}
}

/// @func	getPowerupDescription({int} idx, {int} lvl);
function getPowerupDescription(_idx, _lvl)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			if (_lvl == 3) return "Lvl 3 Booster Pack. Even more charges (15 charges, 30 max).";
			else if (_lvl == 2) return "Lvl 2 Booster Pack. More charges (10 charges, 20 max).";
			return "Allows you to jump midair (5 charges, 10 max).";
		case Powerup.INVINCIBLE:
			if (_lvl == 3) return "Lvl 3 Star Power. With such high energy being released, anything in your path gets destroyed.";
			else if (_lvl == 2) return "Lvl 2 Star Power. Slow the fusion process, increasing the duration to 30 seconds.";
			return "Harness the power of the stars and become invunerable to damage for 15 seconds.";
		case Powerup.BALL:
			if (_lvl == 3) return "Lvl 3 Ball. Adds a second smaller ball that is faster and ignores graphs. Ghastly!";
			else if (_lvl == 2) return "Lvl 2 Ball. Days of polish don't go unnoticed. The ball's duration is increased to 60 seconds and can't be destroyed by the environment!";
			return "A ball that does your bidding. It can also collect for you! Lasts for 30 seconds.";
		case Powerup.IRON_GRAPH:
			if (_lvl == 3) return "Lvl 3 Iron Graphs.";
			else if (_lvl == 2) return "Lvl 2 Iron Graphs. Your graphs are made of a special alloy, now allowing you to have more graphs at your disposal (4 charges, 4 max)";
			return "Your graphs become made of iron, becoming impervious to damage. (2 charges, 2 max)";
		case Powerup.BLOCK:
			if (_lvl == 3) return "Lvl 3 Block. Blocks now collect coins for you! So long as they are touching any...";
			else if (_lvl == 2) return "Lvl 2 Block. You become more crafty, allowing for more blocks to be placed. (3 charges, 6 max)";
			return "Place a block at the your feet. (1 charge, 3 max)";
		default:
			if (_lvl == 3) return "Lvl 3 Bubble. A secret recipe. Allows for a 3rd red shield that makes you ignore 60% of gravity!";
			else if (_lvl == 2) return "Lvl 2 Bubble. A special blend. Allows for a 2nd green shield that makes you ignore 40% of gravity.";
			return "Prevents damage once and makes you more ignore 20% of gravity, lasts until popped.";
	}
}

/// @func	getPowerupSprite({int} idx, {int} lvl);
function getPowerupSprite(_idx, _lvl)
{
	switch (_idx)
	{
		case Powerup.AIR_JUMP:
			if (_lvl == 3) return sPowerupAirJump3;
			else if (_lvl == 2) return sPowerupAirJump2;
			return sPowerupAirJump1;
		case Powerup.INVINCIBLE:
			if (_lvl == 3) return sPowerupInvincible3;
			else if (_lvl == 2) return sPowerupInvincible2;
			return sPowerupInvincible1;
		case Powerup.BALL:
			if (_lvl == 3) return sPowerupBall3;
			else if (_lvl == 2) return sPowerupBall2;
			return sPowerupBall1;
		case Powerup.IRON_GRAPH:
			if (_lvl == 3) return sPowerupIronGraph3;
			else if (_lvl == 2) return sPowerupIronGraph2;
			return sPowerupIronGraph1;
		case Powerup.BLOCK:
			if (_lvl == 3) return sPowerupBlock3;
			else if (_lvl == 2) return sPowerupBlock2;
			return sPowerupBlock1;
		default:
			if (_lvl == 3) return sPowerupShield3;
			else if (_lvl == 2) return sPowerupShield2;
			return sPowerupShield1;
	}
}

/// @func	getPowerupCost({int} idx, {int} lvl);
function getPowerupCost(_idx, _lvl)
{
	switch (_idx)
	{
		case Powerup.SHIELD:
			if (_lvl == 3) return 150;
			else if (_lvl == 2) return 75;
			return 0;
		case Powerup.AIR_JUMP:
			if (_lvl == 3) return 100;
			else if (_lvl == 2) return 50;
			return 25;
		case Powerup.INVINCIBLE:
			if (_lvl == 3) return 120;
			else if (_lvl == 2) return 60;
			return 30;
		case Powerup.BALL:
			if (_lvl == 3) return 150;
			else if (_lvl == 2) return 50;
			return 20;
		case Powerup.IRON_GRAPH:
			if (_lvl == 3) return 200;
			else if (_lvl == 2) return 50;
			return 20;
		case Powerup.BLOCK:
			if (_lvl == 3) return 200;
			else if (_lvl == 2) return 40;
			return 20;
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