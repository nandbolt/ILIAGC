// Vectors
delete graphOrigin;

// Tree
delete expressionTree;

// Loop through graph path, emit particles, then delete
var _pointCount = path_get_number(graphPath);
for (var _i = 0; _i < _pointCount - 1; _i++)
{
	var _x = path_get_point_x(graphPath,_i), _y = path_get_point_y(graphPath,_i);
	with (oParticles)
	{
		part_particles_create(partSystem, _x, _y, partTypeDust, 1);
	}
}
path_delete(graphPath);