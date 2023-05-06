// Change scope to collectable
with (other)
{
	// If active
	if (active)
	{
		// Collect
		onCollect();
		
		// Deactivate
		active = false;
		collected = true;
	}
}