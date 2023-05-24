// Inherit the parent event
event_inherited();

// If not collected
if (!collected)
{
	// Fade in
	var _maxAlpha = 0.25;
	if (active) _maxAlpha = 1;
	image_alpha = clamp(image_alpha + alphaFadeSpeed, 0, _maxAlpha);
}