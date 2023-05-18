// Else if graph exists
if (instance_exists(oGraph))
{
	with (oGraph)
	{
		if (molten && touchingGraph(other.id))
		{
			instance_destroy(other);
			exit;
		}
	}
}