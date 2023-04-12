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
}