// Graph
var _pointCount = path_get_number(graphPath);
for (var _i = 0; _i < _pointCount - 1; _i++)
{
	// Get point position
	var _x = path_get_point_x(graphPath,_i), _y = path_get_point_y(graphPath,_i);
	var _xNext = path_get_point_x(graphPath,_i+1), _yNext = path_get_point_y(graphPath,_i+1);
	
	// Draw line
	draw_sprite_pos(sGraphSegment,0,_x,_y-1,_xNext,_yNext-1,_xNext,_yNext+1,_x,_y+1,1);
}