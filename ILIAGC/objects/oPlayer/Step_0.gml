// Update input
xInput = keyboard_check(ord("D")) - keyboard_check(ord("A"));
jumpInputted = keyboard_check_pressed(vk_space);

// Update ground state
if (tilemap_get_at_pixel(collisionTiles,x,y+1)) grounded = true;
else grounded = false;

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

// Apply xInput to x velocity
var _moveStrength = runStrength;
if (!grounded) _moveStrength = driftStrength;
velocity.x += xInput * _moveStrength;

// Apply gravity to y velocity
velocity.y += gravityStrength;

// If jump inputted
if (jumpInputted && grounded)
{
	// Apply jump
	velocity.y = -jumpStrength;
}

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

#region Y Tile Collisions

// If about to collide with tile in x direction
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