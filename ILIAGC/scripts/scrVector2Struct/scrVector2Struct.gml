/// @func	Vector2({real} x, {real} y);
/// @desc	A 2D vector.
function Vector2(_x = 0, _y = 0) constructor
{
	// Init
	x = _x;
	y = _y;
	
	/// @func	setToVector({Vector2} vector);
	static setToVector = function(_vector)
	{
		x = _vector.x;
		y = _vector.y;
	}
	
	/// @func	addVector({Vector2} vector);
	static addVector = function(_vector)
	{
		x += _vector.x;
		y += _vector.y;
	}
	
	/// @func	multiplyByScalar({real} scalar);
	static multiplyByScalar = function(_scalar)
	{
		x *= _scalar;
		y *= _scalar;
	}
	
	/// @func	getLength();
	static getLength = function()
	{
		return sqrt(x * x + y * y);
	}
	
	/// @func	normalize();
	static normalize = function()
	{
		// If not zero vector
		if (x != 0 && y != 0)
		{
			// Get inverse length
			var _inverseLength = 1 / getLength();
			
			// Multiply by inverse length
			multiplyByScalar(_inverseLength);
		}
	}
	
	/// @func	getAngleDegrees();
	static getAngleDegrees = function()
	{
		return point_direction(0,0,x,y);
	}
	
	/// @func	rotate({real} angleDegrees);
	static rotate = function(_angleDegrees)
	{
		// Store length
		var _length = getLength();
		
		// If length is greater than one
		if (_length > 0)
		{
			// Get new angle
			var _angle = getAngleDegrees() + _angleDegrees;
			
			// Set vector direction + magnitude
			x = lengthdir_x(_length, _angle);
			y = lengthdir_y(_length, _angle);
		}
	}
	
	/// @func	dotWithVector({Vector2} other)
	static dotWithVector = function(_other)
	{
		return x * _other.x + y * _other.y;
	}
	
	/// @func	toString();
	static toString = function()
	{
		return "(" + string(x) + "," + string(y) + ")";
	}
}