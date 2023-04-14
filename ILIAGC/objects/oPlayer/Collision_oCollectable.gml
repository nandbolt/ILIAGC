// Change scope to collectable
with (other)
{
	// If active
	if (active)
	{
		// Call collect function
		onCollect();
		
		// Destroy collectable
		instance_destroy();
	}
}