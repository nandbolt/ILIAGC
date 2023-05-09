// If not active
if (!active)
{
	// Activate if visible
	if (image_alpha >= 1)
	{
		image_alpha = 1;
		active = true;
	}
	else image_alpha += fadeSpeed;
}