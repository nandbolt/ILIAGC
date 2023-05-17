// Inherit the parent event
event_inherited();

// Exit if not active
if (!active) exit;

// If graph exists
var _graph = noone;
if (instance_exists(oGraph))
{
	// Check all graphs
	with (oGraph)
	{
		// If any points disagree
		var _aboveGraph = pointAboveGraph(other.bbox_left, other.bbox_top);
		if (_aboveGraph != pointAboveGraph(other.bbox_right, other.bbox_top) || _aboveGraph != pointAboveGraph(other.bbox_right, other.bbox_bottom) ||
			_aboveGraph != pointAboveGraph(other.bbox_left, other.bbox_bottom))
		{
			// On graph
			if (_graph == noone) _graph = self;
		}
	}
}

// If on graph
if (_graph != noone)
{
	// Get direction
	var _x = x + xInput, _y = y;
	with (_graph)
	{
		_y = convertGraphYToY(getGraphOutput(convertXToGraphX(_x)));
	}
	
	// If goal point is not out of bounds
	if (_x > 16 && _x < 176 && _y > 16 && _y < 176)
	{
		// Set velocity to goal point
		var _r = new Vector2(_x - x, _y - y);
		_r.normalize();
		_r.multiplyByScalar(graphCrawlSpeed);
		velocity.x = _r.x;
		velocity.y = _r.y;
	}
	delete _r;
	
	// Reflect velocity if about to collide with tiles
	if (tilemap_get_at_pixel(collisionTiles, x + velocity.x, y + velocity.y) == 1)
	{
		velocity.multiplyByScalar(-1);
		xInput *= -1;
	}
}
else
{
	// If next to wall
	if (tilemap_get_at_pixel(collisionTiles, x + 1, y) == 1) xInput = -1;
	else if (tilemap_get_at_pixel(collisionTiles, x - 1, y) == 1) xInput = 1;
}

// If not touching graph
if (_graph == noone)
{
	// Update ground state
	rbUpdateGroundState();

	// Resistances
	rbHandleResistances();

	// Apply xInput to x velocity
	if (grounded) velocity.x += xInput * crawlStrength;

	// Gravity
	rbApplyGravity();
}

// Graph collisions
rbHandleGraphCollisions();

// X Tile Collisions
rbHandleXTileCollisions();

// Y Tile Collisions
rbHandleYTileCollisions();

// Rotate
var _diff = angle_difference(velocity.getAngleDegrees(), image_angle);
image_angle += _diff * rotationSpeed;

// Update legs
var _dir = image_angle - 45;
for (var _i = 0; _i < array_length(legs); _i++)
{
	// Update leg body position
	legs[_i][0].x = x + lengthdir_x(4, _dir);
	legs[_i][0].y = y + lengthdir_y(4, _dir);
	_dir += 90;
	
	// If leg too outstretched
	var _currentLegLength = point_distance(legs[_i][0].x, legs[_i][0].y, legs[_i][1].x, legs[_i][1].y);
	var _legAngle = point_direction(x, y, legs[_i][1].x, legs[_i][1].y);
	if (_currentLegLength > maxLegLength && abs(angle_difference(_legAngle, image_angle)) > 45)
	{
		// Update goal position
		var _angle = velocity.getAngleDegrees();
		legs[_i][2].x = x + lengthdir_x(maxLegLength + 10, _angle);
		legs[_i][2].y = y + lengthdir_y(maxLegLength + 10, _angle);
	}
	
	// Move legs to goal position
	legs[_i][1].x = lerp(legs[_i][1].x, legs[_i][2].x, 0.1);
	legs[_i][1].y = lerp(legs[_i][1].y, legs[_i][2].y, 0.1);
}