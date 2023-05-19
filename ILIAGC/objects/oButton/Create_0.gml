// Parent
parent = noone;

// Neighbors [Left, Right, Up, Down]
neighbors = [
	noone,
	noone,
	noone,
	noone
];

// Menu
selected = false;

/// @func	select();
select = function()
{
	selected = true;
	image_blend = c_yellow;
}

/// @func	unselect();
unselect = function()
{
	selected = false;
	image_blend = c_white;
}