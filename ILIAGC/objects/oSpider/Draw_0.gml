// Get point position
for (var _i = 0; _i < array_length(legs); _i++)
{
	var _r = new Vector2(legs[_i][1].x - legs[_i][0].x, legs[_i][1].y - legs[_i][0].y);
	var _dir = _r.getAngleDegrees();
	var _len = _r.getLength();

	// Draw line
	draw_sprite_ext(sSpiderLeg, 0, legs[_i][0].x, legs[_i][0].y, _len, 1, _dir, image_blend, image_alpha);
	
	delete _r;
}

// Self
draw_self();