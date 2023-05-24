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
	// Fade in collectable
	else image_alpha = clamp(image_alpha + alphaFadeSpeed, 0, 0.25);
}
else nearbyTimer = 0;