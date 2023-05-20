// Inherit the parent event
event_inherited();

// If not collected
if (!collected)
{
	// Decrement nearby timer if has time
	if (nearbyTimer > 0)
	{
		// Update image alpha
		image_alpha = 1;
	
		// Decrement timer
		nearbyTimer--;
	}
	else image_alpha = 0.25;
}