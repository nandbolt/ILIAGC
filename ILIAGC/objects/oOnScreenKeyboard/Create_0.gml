// Inherit the parent event
event_inherited();

// Menu
menuLayer = "HUDInstances";

// Origin
originX = TILE_SIZE * 2;
originY = TILE_SIZE * 7;

// Buttons
buttonIdx = 24;

#region Buttons

// 1st row
var _x = originX, _y = originY;
var _xoff = TILE_SIZE, _yoff = TILE_SIZE;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonSin));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonLog));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum7));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum8));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum9));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonSlash));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonOpenParenthesis));

// 2nd row
_x = originX;
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonCos));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonRoot));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum4));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum5));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum6));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonAsterisk));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonCloseParenthesis));

// 3rd row
_x = originX;
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonTan));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonCarrot));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum1));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum2));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum3));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonMinus));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonBackspace));

// 4th row
_x = originX;
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonPi));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonE));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum0));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonX));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonDecimal));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonPlus));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonEnter));

#endregion