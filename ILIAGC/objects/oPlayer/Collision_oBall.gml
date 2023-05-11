// Kick
with (other)
{
	var _r = new Vector2();
	
	// Add velocity if moving
	if (other.velocity.getLength() > 0)
	{
		_r.x = other.velocity.x;
		_r.y = other.velocity.y;
	}
	// Use displacement if not moving
	else
	{
		_r.x = x - other.x;
		_r.y = y - other.y;
	}
	_r.normalize();
	_r.multiplyByScalar(1);
	velocity.addVector(_r);
	delete _r;
}