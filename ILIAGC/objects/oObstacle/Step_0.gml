// If not active
if (!active)
{
	// Activate if visible
	if (fadeCounter < fadeTime) fadeCounter++;
	else active = true;
	
	// Set image alpha
	image_alpha = (fadeCounter / fadeTime) * activeImageAlpha;
}