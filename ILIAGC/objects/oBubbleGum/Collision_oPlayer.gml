// If active
if (active)
{
	// Make player bouncy
	with (other)
	{
		if (!invincible)
		{
			collisionType = Collision.BOUNCE;
			bubbleGumTimer = 600;
		}
	}

	// Destroy self
	instance_destroy();
	exit;
}