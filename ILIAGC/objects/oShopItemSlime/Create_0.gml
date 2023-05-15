// Inherit the parent event
event_inherited();

// Text
description = "Slime";
price = 0;

/// @func	onCollect();
onCollect = function()
{
	var _x = oPlayer.x, _y = oPlayer.y;
	var _velocityX = oPlayer.velocity.x, _velocityY = oPlayer.velocity.y;
	instance_destroy(oPlayer);
	var _character = instance_create_layer(_x, _y, "Instances", oPlayerSlime);
	with (_character)
	{
		velocity.x = _velocityX;
		velocity.y = _velocityY;
	}
	oGame.myCharacters[Character.SLIME][1]++;
}