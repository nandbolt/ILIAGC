// Inherit the parent event
event_inherited();

// Food
food = Food.BUBBLE_TEA;

/// @func	onCollect();
onCollect = function()
{
	eatFood(food);
}