// Inherit the parent event
event_inherited();

// Alpha toggle
if (toggledOn) image_alpha = 1;
else image_alpha = clamp(image_alpha + alphaFadeSpeed, 0, 0.25);