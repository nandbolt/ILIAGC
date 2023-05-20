// Inherit the parent event
event_inherited();

// Text
description = "???";
interactDescription = "Go?";

// Interactable
nearbyTimer = 0;

/// @func	drawDescription();
drawDescription = function()
{
	draw_text_ext_transformed(x, y - 6, description, 14, 64, 0.5, 0.5, 0);
}

// Set alpha
image_alpha = 0.25;