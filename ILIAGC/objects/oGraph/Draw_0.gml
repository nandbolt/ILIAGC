// Graph
var _pointCount = path_get_number(graphPath);
var _drawPercent = 1;
if (drawCounter < drawTime) _drawPercent = drawCounter / drawTime;
var _c = normalGraphColor, _a = 1;
if (oGrapher.editingEquation && graphIdx == oGrapher.graphIdx) _c = c_yellow;
else if (ironGraphTimer > 0)
{
	if (molten) _c = c_red;
	else _c = c_lime;
}
for (var _i = 0; _i < _pointCount - 1; _i++)
{
	// Check draw percent
	if (drawCounter < drawTime && _pointCount != 0)
	{
		var _currentDrawPercent = _i / _pointCount;
		if (_currentDrawPercent > _drawPercent) break;
	}
	
	// Get point position
	var _x = path_get_point_x(graphPath, _i), _y = path_get_point_y(graphPath, _i);
	var _xNext = path_get_point_x(graphPath,_i + 1), _yNext = path_get_point_y(graphPath,_i + 1);
	var _rx = _xNext - _x, _ry = _yNext - _y;
	var _dir = point_direction(0, 0, _rx, _ry);
	var _dirRounded = round(_dir);
	var _len = point_distance(0, 0, _rx, _ry);
	
	// Check whether to set line as invisible (asymptote)
	if ((_dirRounded == 90 || _dirRounded == 270) &&
		!pointVisible(_x, _y) && !pointVisible(_xNext, _yNext))  _a = 0.2;
	
	// Draw line
	draw_sprite_ext(graphSegment, 0, _x, _y, _len, 1, _dir, _c, _a);
	
	// Reset alpha
	_a = 1;
}