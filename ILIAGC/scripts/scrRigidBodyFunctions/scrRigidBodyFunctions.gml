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
	
	// Collisions
	collisionType = Collision.SLIDE;
	collisionTiles = layer_tilemap_get_id("CollisionTiles");
	collisionThreshold = 0.1;
	collisionVelocity = new Vector2();
	
	// Sounds
	landSound = sfxLand;
	
	#region Functions
	
	/// @func	onLand();
	onLand = function(){}
	
	#endregion
}

/// @func	cleanupRigidBody();
function cleanupRigidBody()
{
	// Vectors
	delete velocity;
	delete normal;
	delete airResistance;
	delete groundResistance;
	delete collisionVelocity;
}

/// @func	rbHandleGraphCollisions();
function rbHandleGraphCollisions()
{
	// Reset collision velocity
	collisionVelocity.x = 0;
	collisionVelocity.y = 0;
	
	// If not ignoring graphs
	if (!ignoreGraphs)
	{
		// Loop through all graphs
		with (oGraph)
		{
			// If above function but trying to go below it (collision)
			if (pointAboveGraph(other.x, other.y) && !pointAboveGraph(other.x + other.velocity.x, other.y + other.velocity.y))
			{
				// Loop until close enough to tile
				var _r = new Vector2(other.velocity.x * 0.5, other.velocity.y * 0.5);
				while (_r.getLength() > other.collisionThreshold)
				{
					// Move closer to graph if not about to collide with tile in x direction
					if (pointAboveGraph(other.x + _r.x, other.y + _r.y))
					{
						other.x += _r.x;
						other.y += _r.y;
					}
					// Else halve velocity
					else _r.multiplyByScalar(0.5);
				}
				delete _r;
				
				// Get normal
				var _leftY = convertGraphYToY(getGraphOutput(convertXToGraphX(other.x - 1)));
				var _rightY = convertGraphYToY(getGraphOutput(convertXToGraphX(other.x + 1)));
				with (other)
				{
					normal.x = 2;
					normal.y = _rightY - _leftY;
					normal.rotate(90);
					normal.normalize();
					
					// Calculate resultant velocity
					if (normal.x != 0)
					{
						var _r = new Vector2(normal.x, normal.y);
						var _dotProduct = velocity.dotWithVector(_r);
						_r.multiplyByScalar(_dotProduct);
						if (collisionType == Collision.BOUNCE) _r.multiplyByScalar(2);
						velocity.x -= _r.x;
						velocity.y -= _r.y;
					}
					else
					{
						if (collisionType == Collision.BOUNCE) collisionVelocity.y = -velocity.y;
						velocity.y = 0;
					}
				}
					
				// Calculate resulting velocity
				if (other.collisionType == Collision.SLIDE)
				{
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
				
				// Land if wasn't grounded
				with (other)
				{
					if (!grounded) rbLand();
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
		// Store bounce velocity
		collisionVelocity.x = -velocity.x;
		
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
	
	// Update x
	x += velocity.x;
	
	// Set velocity to bounce if applicable
	if (collisionType == Collision.BOUNCE && collisionVelocity.x != 0) velocity.x = collisionVelocity.x;
}

/// @func	rbHandleYTileCollisions();
function rbHandleYTileCollisions()
{
	// If about to collide with tile in y direction
	var _tile = tilemap_get_at_pixel(collisionTiles, x, y + velocity.y);
	if (_tile == 1)
	{
		// Store bounce velocity
		collisionVelocity.y = -velocity.y;
		
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
		
		// If landed
		if (!grounded && velocity.y > 0) rbLand();
		
		// Reset velocity
		velocity.y = 0;
		
		// Set normal
		normal.x = 0;
		normal.y = -1;
	}
	
	// Update y
	y += velocity.y;
	
	// Set velocity to bounce if applicable
	if (collisionType == Collision.BOUNCE && collisionVelocity.y != 0) velocity.y = collisionVelocity.y;
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
	// Only update ground state if grounded (collisions should take care of airborne)
	if (grounded)
	{
		// Check if still on ground
		var _onGround = false;
		if (tilemap_get_at_pixel(collisionTiles,x,y+1)) _onGround = true;
		else if (!ignoreGraphs && instance_exists(oGraph))
		{
			// Loop through all graphs
			with (oGraph)
			{
				// If about to collide with a graph in y direction
				var _graphY = getGraphOutput(convertXToGraphX(other.x));
				var _otherGraphY = convertYToGraphY(other.y), _otherGraphGoalY = convertYToGraphY(other.y + 1);
				if (_otherGraphY > _graphY && _otherGraphGoalY <= _graphY) _onGround = true;
			}
		}
		
		// Update ground state if not on ground
		if (!_onGround) grounded = false;
	}
}

/// @func	rbApplyGravity();
function rbApplyGravity()
{
	// Apply gravity to y velocity
	velocity.y += gravityStrength;
}

/// @func	rbLand();
function rbLand()
{
	// Call on land function
	onLand();
	
	// Set ground state
	grounded = true;
	
	// Land sound
	audio_play_sound(landSound, 1, false);
}