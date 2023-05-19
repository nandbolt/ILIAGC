// Inherit the parent event
event_inherited();

// Menu
menuLayer = "HUDInstances";

// Origin
originX = TILE_SIZE;
originY = TILE_SIZE * 7;

// Add buttons
var _x = originX, _y = originY;
var _xoff = TILE_SIZE, _yoff = TILE_SIZE;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum7));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum8));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum9));
_x = originX;
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum4));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum5));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum6));
_x = originX;
_y += _yoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum1));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum2));
_x += _xoff;
array_push(buttons, instance_create_layer(_x, _y, menuLayer, oOSKButtonNum3));