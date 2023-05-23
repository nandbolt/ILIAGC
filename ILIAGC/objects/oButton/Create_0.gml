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
	image_alpha = 1;
}

/// @func	unselect();
unselect = function()
{
	selected = false;
	image_blend = c_white;
	image_alpha = 0.5;
}

/// @func	onPressed();
onPressed = function(){}

// Init alpha
image_alpha = 0.5;