// Spin
spinCounter += spinSpeed;
imageXScale = cos(spinCounter);

// If collected
if (collected)
{
	// Fade out collectable
	image_alpha -= alphaFadeSpeed;
	if (image_alpha <= 0) instance_destroy();
	
	// Move up
	y -= driftUpSpeed;
	
	// Spin faster
	spinCounter += spinBoost;
}