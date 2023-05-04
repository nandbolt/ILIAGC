// Graph
var _pointCount = path_get_number(graphPath);
for (var _i = 0; _i < _pointCount - 1; _i++)
{
	// Get point position
	var _x = path_get_point_x(graphPath,_i), _y = path_get_point_y(graphPath,_i);
	var _xNext = path_get_point_x(graphPath,_i+1), _yNext = path_get_point_y(graphPath,_i+1);
	var _rx = _xNext - _x, _ry = _yNext - _y;
	var _dir = point_direction(0,0,_rx,_ry);
	var _len = point_distance(0,0,_rx,_ry)
	
	// Draw line
	draw_sprite_ext(sGraphSegment,0,_x,_y,_len,1,_dir,c_white,1);
}