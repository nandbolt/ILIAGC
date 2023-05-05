// Spin
imageAngle -= 10;

// If graph exists
if (instance_exists(oGraph))
{
	// Check all graphs
	with (oGraph)
	{
		// If any points disagree
		var _aboveGraph = pointAboveGraph(other.bbox_left, other.bbox_top);
		if (_aboveGraph != pointAboveGraph(other.bbox_right, other.bbox_top) || _aboveGraph != pointAboveGraph(other.bbox_right, other.bbox_bottom) ||
			_aboveGraph != pointAboveGraph(other.bbox_left, other.bbox_bottom))
		{
			instance_destroy();
		}
	}
}