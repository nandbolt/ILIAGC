var _x = 0, _y = 0;

var _s = 0.25, _xoff = 0, _yoff = 4;

// World stats
if (!oGame.gamePaused)
{
	draw_set_halign(fa_right);
	draw_set_valign(fa_middle);
	_x = 174;
	_y = 31;
	draw_set_color(c_gray);
	draw_text_transformed(_x, _y, "Game", _s, _s, 0);
	_y += _yoff;
	draw_text_transformed(_x, _y, "FPS: "+string(fps), _s, _s, 0);
	_y += _yoff;
	draw_text_transformed(_x, _y, "Instances: "+string(instance_count), _s, _s, 0);
	_y += _yoff;
	draw_text_transformed(_x, _y, "Gamepads: "+string(oInput.gamepadCount), _s, _s, 0);
	_y += _yoff;
	_xoff = 0;
	for (var _playerId = 0; _playerId < ds_list_size(oInput.playerGamepadIds); _playerId++)
	{
		draw_text_transformed(_x + _xoff, _y, "P" + string(_playerId + 1) + ": " + string(oInput.playerGamepadIds[| _playerId]), _s, _s, 0);
		_xoff += 15;
	}
	_y += _yoff * 2;
	
	// Reset color
	draw_set_color(c_white);
}

// Mode
if (oWorld.gameStarted)
{
	// Set draw color
	draw_set_color(c_gray);
	
	// World scope
	with (oWorld)
	{
		draw_text_transformed(_x, _y, getModeName(gameMode), _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Difficulty: " + string(difficultyFactor == 1 ? "MAX" : difficultyFactor), _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Next obstacle in " + string(obstacleTimer), _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Obstables to spawn: " + string(obstaclesToSpawn), _s, _s, 0);
		_y += _yoff;
		draw_text_transformed(_x, _y, "Powerup diversity: " + string(powerupDiversity), _s, _s, 0);
		_y += _yoff * 2;
	}
	
	// Reset color
	draw_set_color(c_white);
}

// Player
if (instance_exists(oPlayer))
{
	with (oPlayer)
	{
		// Vectors
		draw_sprite_ext(sGraphSegment, 0, x, y, abs(velocity.getLength())*5, 0.5, velocity.getAngleDegrees(), c_lime, 0.8);
		draw_sprite_ext(sGraphSegment, 0, x, y, 10, 0.5, normal.getAngleDegrees(), c_yellow, 0.8);

		// Hitbox
		draw_set_alpha(0.5);
		draw_sprite_stretched(sBallCollider, 0, bbox_left, bbox_top, bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_alpha(1);

		// Origin
		draw_sprite(sGraphSegment, 0, x-0.5, y-0.5);
		
		// Info
		if (playerId == 0)
		{
			// Set text color
			draw_set_color(c_gray);
			
			// First player info
			draw_text_transformed(_x, _y, "Player", _s, _s, 0);
			_y += _yoff;
			var _graphX = convertXToGraphX(x);
			draw_text_transformed(_x, _y, "Pos: (" + string(x) + ", " + string(y) + ")", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Local Pos: (" + string(_graphX) + ", " + string(convertYToGraphY(y)) + ")", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Speed: " + string(velocity.getLength()), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Grounded: " + string(grounded), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Graph collision: " + string(collidedWithGraph), _s, _s, 0);
			_y += _yoff * 2;
		
			// If graphs exist
			if (instance_exists(oGraph))
			{
				with (oGraph)
				{
					// Show output
					draw_text_transformed(_x, _y, "y" + string(graphIdx + 1) + "(x) = " + string(getGraphOutput(_graphX)), _s, _s, 0);
					_y += _yoff;
					draw_text_transformed(_x, _y, "Postfix: " + postfixEquation, _s, _s, 0);
					_y += _yoff * 2;
				}
			}
		
			// Reset color
			draw_set_color(c_white);
		}
	}
}

// Collectables
if (instance_exists(oCollectable))
{
	with (oCollectable)
	{
		// Hitbox
		draw_set_alpha(0.5);
		draw_sprite_stretched(sBallCollider, 0, bbox_left, bbox_top, bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_alpha(1);
	}
}

// Obstacles
if (instance_exists(oObstacle))
{
	with (oObstacle)
	{
		// Hitbox
		draw_set_alpha(0.5);
		draw_sprite_stretched(sBallCollider, 0, bbox_left, bbox_top, bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_alpha(1);
	}
}

// Ball
if (instance_exists(oBall))
{
	with (oBall)
	{
		// Hitbox
		draw_set_alpha(0.5);
		draw_sprite_stretched(sBallCollider, 0, bbox_left, bbox_top, bbox_right - bbox_left, bbox_bottom - bbox_top);
		draw_set_alpha(1);
	}
}