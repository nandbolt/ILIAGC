// Inherit the parent event
event_inherited();

// Text
description = "Debug Mode";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	if (!instance_exists(oDebug)) instance_create_layer(0,0,"Instances",oDebug);
	oGame.myMisc[Misc.DEBUG_MODE][1]++;
}