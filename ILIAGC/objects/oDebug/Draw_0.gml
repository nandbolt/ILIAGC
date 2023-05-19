var _x = 0, _y = 0;

var _s = 0.25, _yoff = 4;

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
		
		// Player stats
		if (!oGrapher.editingEquation)
		{
			draw_set_halign(fa_left);
			draw_set_valign(fa_middle);
			_x = 22;
			_y = 31;
			draw_set_color(c_gray);
			draw_text_transformed(_x, _y, "Game", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "FPS Real: "+string(fps_real), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "FPS: "+string(fps), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Instances: "+string(instance_count), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Gamepads: "+string(oInput.gamepadCount), _s, _s, 0);
			_y += _yoff * 2;
			draw_text_transformed(_x, _y, "Player", _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "Grounded: " + string(grounded), _s, _s, 0);
			_y += _yoff;
			draw_text_transformed(_x, _y, "World Pos: (" + string(x) + ", " + string(y) + ")", _s, _s, 0);
			_y += _yoff;
			var _graphX = convertXToGraphX(x);
			draw_text_transformed(_x, _y, "Graph Pos: (" + string(_graphX) + ", " + string(convertYToGraphY(y)) + ")", _s, _s, 0);
			_y += _yoff;
			
			// If graphs exist
			if (instance_exists(oGraph))
			{
				with (oGraph)
				{
					// Show output
					draw_text_transformed(_x, _y, "y" + string(graphIdx + 1) + "(x) = " + string(getGraphOutput(_graphX)), _s, _s, 0);
					_y += _yoff;
				}
				
				// Graph collision
				draw_text_transformed(_x, _y, "Graph collision: " + string(collidedWithGraph), _s, _s, 0);
				_y += _yoff;
			}
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