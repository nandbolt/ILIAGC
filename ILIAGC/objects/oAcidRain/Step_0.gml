// Update ground state
rbUpdateGroundState();

// Resistances
rbHandleResistances();

// Gravity
rbApplyGravity();

// Repel other rain
var _otherRainInstance = instance_place(x,y,oAcidRain);
if (_otherRainInstance != noone)
{
	var _r = new Vector2(_otherRainInstance.x - x, _otherRainInstance.y - y)
	_r.normalize();
	_r.multiplyByScalar(-0.05);
	velocity.x += _r.x;
	velocity.y += _r.y;
}

// Graph collisions
rbHandleGraphCollisions();

// X Tile Collisions
rbHandleXTileCollisions();

// Update x
x += velocity.x;

// Y Tile Collisions
rbHandleYTileCollisions();

// Update y
y += velocity.y;