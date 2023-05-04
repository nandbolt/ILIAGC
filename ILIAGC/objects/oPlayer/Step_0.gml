// Update input
xInput = getRightXInput() - getLeftXInput();
jumpInputted = getJumpInput();
crouchInputted = getCrouchInput();

#region Ground State

// Update ground state
grounded = false;
if (tilemap_get_at_pixel(collisionTiles,x,y+1)) grounded = true;
else if (!crouchInputted && instance_exists(oGraph))
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

// Set coyote buffer
if (!grounded) coyoteBufferCounter = clamp(coyoteBufferCounter-1,0,coyoteBuffer);
else coyoteBufferCounter = coyoteBuffer;

#endregion

#region Resistances (Friction)

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

#endregion

// Apply xInput to x velocity
var _moveStrength = runStrength;
if (!grounded) _moveStrength = driftStrength;
velocity.x += xInput * _moveStrength;

// Apply gravity to y velocity
velocity.y += gravityStrength;

#region Jump

// Set jump buffer counter
if (jumpInputted) jumpBufferCounter = jumpBuffer;
else jumpBufferCounter = clamp(jumpBufferCounter-1,0,jumpBuffer);

// If jump buffered and grounded or jump buffered and coyote ready
var _jumpFrame = false;
if ((jumpBufferCounter > 0 && grounded) || (jumpBufferCounter > 0 && coyoteBufferCounter > 0))
{
	// Apply jump
	velocity.y = -jumpStrength;
	
	// Reset jump
	jumpBufferCounter = 0;
	coyoteBufferCounter = 0;
	_jumpFrame = true;
}

#endregion

#region Graph Collisions

// If not crouching
if (!crouchInputted)
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

#endregion

#region X Tile Collisions

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

#endregion

// Update x
x += velocity.x;
graphPosition.x = convertXToGraphX(x);

#region Y Tile Collisions

// If about to collide with tile in y direction
_tile = tilemap_get_at_pixel(collisionTiles, x, y + velocity.y);
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

#endregion

// Update y
y += velocity.y;
graphPosition.y = convertYToGraphY(y);
//show_debug_message("Position: " + string(x) + "," + string(y));
//show_debug_message("Graph position: " + string(graphPosition));

#region Animations

// If airborne
if (!grounded) sprite_index = sPlayerAirborne;
// Else if inputted an x direction
else if (xInput != 0)
{
	// Run animation
	sprite_index = sPlayerRunning;
	if (xInput > 0) image_xscale = 1;
	else image_xscale = -1;
}
// Else idle animation
else sprite_index = sPlayerIdle;

// If grounded
if (grounded) image_blend = c_aqua;
else image_blend = c_white;

#endregion