// If active
if (active)
{
	// Make player bouncy
	with (other)
	{
		collisionType = Collision.BOUNCE;
		bubbleGumTimer = 600;
	}

	// Destroy self
	instance_destroy();
}