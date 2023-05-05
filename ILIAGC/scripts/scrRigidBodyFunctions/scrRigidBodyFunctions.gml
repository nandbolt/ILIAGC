/// @func	initRigidBody();
function initRigidBody()
{
	// States
	grounded = false;
	ignoreGraphs = false;
	
	// Movement
	velocity = new Vector2();
	normal = new Vector2();
	
	// Gravity
	gravityStrength = 0.1;

	// Resistances
	airResistance = new Vector2();
	airConstant = 0.002;
	groundResistance = new Vector2();
	groundConstant = 0.15;
	
	// Tilemaps
	collisionTiles = layer_tilemap_get_id("CollisionTiles");
	collisionThreshold = 0.1;
}

/// @func	cleanupRigidBody();
function cleanupRigidBody()
{
	// Vectors
	delete velocity;
	delete normal;
	delete airResistance;
	delete groundResistance;
}

/// @func	rbHandleGraphCollisions();
function rbHandleGraphCollisions()
{
	// If not ignoring graphs
	if (!ignoreGraphs)
	{
		// Loop through all graphs
		with (oGraph)
		{
			// If above function but trying to go below it (collision)
			if (pointAboveGraph(other.x, other.y) && !pointAboveGraph(other.x + other.velocity.x, other.y + other.velocity.y))
			{
				// Get normal
				var _leftY = convertGraphYToY(getGraphOutput(convertXToGraphX(other.x - 1)));
				var _rightY = convertGraphYToY(getGraphOutput(convertXToGraphX(other.x + 1)));
				other.normal.x = 2;
				other.normal.y = _rightY - _leftY;
				other.normal.rotate(90);
				other.normal.normalize();
			
				// Slide
				if (other.normal.x != 0)
				{
					var _r = new Vector2(other.normal.x,other.normal.y);
					var _dotProduct = other.velocity.dotWithVector(_r);
					_r.multiplyByScalar(_dotProduct);
					other.velocity.x -= _r.x;
					other.velocity.y -= _r.y;
				}
				else other.velocity.y = 0;
			
				// Get rotation direction
				var _rotationDirection = sign(angle_difference(other.normal.getAngleDegrees(), other.velocity.getAngleDegrees()));
			
				// Rotate until above graph
				var _count = 0;
				while (!pointAboveGraph(other.x + other.velocity.x, other.y + other.velocity.y))
				{
					// Rotate velocity
					other.velocity.rotate(_rotationDirection);
					_count++;
					if (_count > 45)
					{
						other.velocity.x = 0;
						other.velocity.y = 0;
						break;
					}
				}
			}
		}
	}
}

/// @func	rbHandleXTileCollisions();
function rbHandleXTileCollisions()
{
	// If about to collide with tile in x direction
	var _tile = tilemap_get_at_pixel(collisionTiles, x + velocity.x, y);
	if (_tile == 1)
	{
		// Halve velocity
		velocity.x *= 0.5;
	
		// Loop until close enough to tile
		while (abs(velocity.x) > collisionThreshold)
		{
			// Move closer to tile if not about to collide with tile in x direction
			_tile = tilemap_get_at_pixel(collisionTiles, x + velocity.x, y);
			if (_tile != 1) x += velocity.x;
			// Else halve velocity
			else velocity.x *= 0.5;
		}
	
		// Reset velocity
		velocity.x = 0;
	}
}

/// @func	rbHandleYTileCollisions();
function rbHandleYTileCollisions()
{
	// If about to collide with tile in y direction
	var _tile = tilemap_get_at_pixel(collisionTiles, x, y + velocity.y);
	if (_tile == 1)
	{
		// Halve velocity
		velocity.y *= 0.5;
	
		// Loop until close enough to tile
		while (abs(velocity.y) > collisionThreshold)
		{
			// Move closer to tile if not about to collide with tile in x direction
			_tile = tilemap_get_at_pixel(collisionTiles, x, y + velocity.y);
			if (_tile != 1) y += velocity.y;
			// Else halve velocity
			else velocity.y *= 0.5;
		}
	
		// Reset velocity
		velocity.y = 0;
	}
}

/// @func	rbHandleResistances();
function rbHandleResistances()
{
	// If moving
	var _speed = velocity.getLength();
	//show_debug_message(_speed);
	if (_speed > 0)
	{
		// Calculate air resistance
		airResistance.setToVector(velocity);
		airResistance.multiplyByScalar(-1 * airConstant * _speed * _speed);
	
		// Apply air resistance
		velocity.addVector(airResistance);
	
		// If grounded
		if (grounded)
		{
			// Calculate ground resistance
			groundResistance.setToVector(velocity);
			groundResistance.multiplyByScalar(-1 * groundConstant);
		
			// Apply ground resistance (account for overshoot)
			var _dir = sign(velocity.x);
			velocity.addVector(groundResistance);
			if (sign(velocity.x) != _dir) velocity.x = 0;
		}
	}
}

/// @func	rbUpdateGroundState();
function rbUpdateGroundState()
{
	grounded = false;
	if (tilemap_get_at_pixel(collisionTiles,x,y+1)) grounded = true;
	else if (!ignoreGraphs && instance_exists(oGraph))
	{
		// Loop through all graphs
		with (oGraph)
		{
			// If about to collide with a graph in y direction
			var _graphY = getGraphOutput(convertXToGraphX(other.x));
			var _otherGraphY = convertYToGraphY(other.y), _otherGraphGoalY = convertYToGraphY(other.y + 1);
			if (_otherGraphY > _graphY && _otherGraphGoalY <= _graphY) other.grounded = true;
		}
	}
}

/// @func	rbApplyGravity();
function rbApplyGravity()
{
	// Apply gravity to y velocity
	velocity.y += gravityStrength;
}