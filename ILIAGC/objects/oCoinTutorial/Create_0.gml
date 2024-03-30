// Inherit the parent event
event_inherited();

/// @func	onCollect();
onCollect = function()
{
	// Update coins
	oWorld.coins += value;
	
	// Progress tutorial
	with (oTutorial)
	{
		progressTutorial();
	}
	
	// Make sure there is another coin
	if (nextCoin == noone) spawnNextCoin();
	
	// Activate next coin
	with (nextCoin)
	{
		activate();
	}
}

/// @func	spawnNextCoin();
spawnNextCoin = function()
{
	// Spawn coin
	var _x = random_range(oWorld.spawnMinX, oWorld.spawnMaxX), _y = random_range(oWorld.spawnMinY, oWorld.spawnMaxY);
	switch (oTutorial.tutorialIdx)
	{
		// Basic movment + jumping
		case 0:
			_x = 96;
			_y = 144;
			break;
		// Crouching + sliding
		case 1:
			_x = 32;
			_y = 168;
			break;
		// Graphing preface
		case 2:
			_x = 96;
			_y = 128;
			break;
		// Basic graphing
		case 3:
			_x = 32;
			_y = 94;
			break;
		// Go through graph
		case 4:
			_x = 96;
			_y = 168;
			break;
		// Graph eaters
		case 5:
			_x = 96;
			_y = 112;
			break;
		// Two graphs
		case 6:
			_x = 96;
			_y = 32;
			break;
	}
	
	nextCoin = instance_create_layer(_x, _y, "Instances", oCoinTutorial);
}