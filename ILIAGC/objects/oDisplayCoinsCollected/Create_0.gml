// Inherit the parent event
event_inherited();

// Current theme
var _theme = getCurrentTheme();
if (_theme == Theme.NEOKYO_CITY) sprite_index = sInfoDisk;
else if (_theme == Theme.NNE) sprite_index = sMinerals;