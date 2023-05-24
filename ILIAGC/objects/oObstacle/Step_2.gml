// If active
if (active)
{
	// Else if graph exists
	if (instance_exists(oGraph))
	{
		with (oGraph)
		{
			if (molten && touchingGraph(other.id))
			{
				instance_destroy(other);
			}
		}
	}
}
else if (hp <= 0 && fadeCounter <= 0) instance_destroy();