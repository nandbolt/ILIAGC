// Inherit parent
event_inherited();

// Spin
image_angle -= 10;

// If graph exists
if (instance_exists(oGraph))
{
	// Check all graphs
	with (oGraph)
	{
		// If not iron graph
		if (!ironGraph)
		{
			// If any points disagree
			var _aboveGraph = pointAboveGraph(other.bbox_left, other.bbox_top);
			if (_aboveGraph != pointAboveGraph(other.bbox_right, other.bbox_top) || _aboveGraph != pointAboveGraph(other.bbox_right, other.bbox_bottom) ||
				_aboveGraph != pointAboveGraph(other.bbox_left, other.bbox_bottom))
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
}

// If block exists
if (instance_exists(oBlock))
{
	// Destroy block if colliding with one
	var _block = instance_place(x,y,oBlock);
	if (_block != noone) instance_destroy(_block);
}