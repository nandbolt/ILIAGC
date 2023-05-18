// Inherit parent
event_inherited();

// Spin
image_angle -= 10;

// Exit if not active
if (!active) exit;

// If graph exists
if (instance_exists(oGraph))
{
	// Check all graphs
	with (oGraph)
	{
		// If not iron graph and touching graph
		if (ironGraphTimer <= 0 && touchingGraph(other.id))
		{
			// Clear equation
			with (oGrapher)
			{
				graphs[other.graphIdx][0] = [];
				if (other.graphIdx == graphIdx) equationTokens = [];
			}
			
			// Destroy graph
			instance_destroy();
		}
	}
}

// If block exists
if (instance_exists(oBlock))
{
	// Destroy block if colliding with one
	var _block = instance_place(x,y,oBlock);
	if (_block != noone) instance_destroy(_block);
}