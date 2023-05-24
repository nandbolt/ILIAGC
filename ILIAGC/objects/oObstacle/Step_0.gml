// If not active
if (!active)
{
	// If has hp (fade in)
	if (hp > 0)
	{
		// Activate if visible
		if (fadeCounter < fadeTime) fadeCounter++;
		else active = true;
	
		// Set image alpha
		image_alpha = (fadeCounter / fadeTime) * activeImageAlpha;
	}
	// Else fade out
	else
	{
		// Activate if visible
		if (fadeCounter > 0) fadeCounter--;
		
		// Set image alpha
		image_alpha = (fadeCounter / fadeTime) * activeImageAlpha;
	}
}