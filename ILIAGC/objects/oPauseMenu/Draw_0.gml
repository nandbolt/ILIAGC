// Paused
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_transformed(room_width * 0.5, 24, "Paused", 0.75, 0.75, 0);

// Menu alignment
draw_set_halign(fa_left);
draw_set_valign(fa_top);
var _x = 36, _y = 63;
var _yoff = 18, _s = 0.5;

// Menu values
draw_set_alpha(0.5);
draw_text_transformed(_x, _y, string(round(oGame.musicGain * 100)) + "%", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, string(round(oGame.sfxGain * 100)) + "%", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, window_get_fullscreen() ? "Yes" : "No", _s, _s, 0);
_y += _yoff;
draw_text_transformed(_x, _y, oGame.tidyUI ? "Yes" : "No", _s, _s, 0);
draw_set_alpha(1);

// Controls
_x = TILE_SIZE * 7;
_y = TILE_SIZE * 2;
_yoff = TILE_SIZE;
draw_sprite(sIconRun, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard())
{
	draw_sprite(sKeyA, 0, _x + 20, _y + 4);
	draw_sprite(sKeyD, 0, _x + 28, _y + 4);
}
else
{
	draw_sprite(sButtonDPadLeft, 0, _x + 20, _y + 4);
	draw_sprite(sButtonDPadRight, 0, _x + 28, _y + 4);
}
_y += _yoff;
draw_sprite(sIconJump, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard()) draw_sprite(sKeySpace, 0, _x + 20, _y + 4);
else draw_sprite(sButtonA, 0, _x + 20, _y + 4);
_y += _yoff;
draw_sprite(sIconInteract, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard()) draw_sprite(sKeyEnter, 0, _x + 20, _y + 4);
else draw_sprite(sButtonX, 0, _x + 20, _y + 4);
_y += _yoff;
draw_sprite(sIconCrouch, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard()) draw_sprite(sKeyS, 0, _x + 20, _y + 4);
else draw_sprite(sButtonDPadDown, 0, _x + 20, _y + 4);
_y += _yoff;
draw_sprite(sIconSlide, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard())
{
	draw_sprite(sKeyA, 0, _x + 20, _y + 4);
	draw_sprite(sKeyD, 0, _x + 28, _y + 4);
	draw_text_transformed(_x + 36, _y + 4, "+", _s, _s, 0);
	draw_sprite(sKeyS, 0, _x + 41, _y + 4);
}
else
{
	draw_sprite(sButtonDPadLeft, 0, _x + 20, _y + 4);
	draw_sprite(sButtonDPadRight, 0, _x + 28, _y + 4);
	draw_text_transformed(_x + 36, _y + 4, "+", _s, _s, 0);
	draw_sprite(sButtonDPadDown, 0, _x + 41, _y + 4);
}
_y += _yoff;
draw_sprite(sIconGoDown, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard())
{
	draw_sprite(sKeyS, 0, _x + 20, _y + 4);
	draw_text_transformed(_x + 28, _y + 4, "+", _s, _s, 0);
	draw_sprite(sKeySpace, 0, _x + 33, _y + 4);
}
else
{
	draw_sprite(sButtonDPadDown, 0, _x + 20, _y + 4);
	draw_text_transformed(_x + 28, _y + 4, "+", _s, _s, 0);
	draw_sprite(sButtonA, 0, _x + 33, _y + 4);
}
_y += _yoff;
draw_sprite(sIconHold, 0, _x, _y);
draw_text_transformed(_x + 16, _y + 4, ":", _s, _s, 0);
if (firstPlayerUsingKeyboard())
{
	draw_sprite(sKeySpace, 0, _x + 20, _y + 4);
	draw_text_transformed(_x + 42, _y + 4, "(Hold)", _s, _s, 0);
}
else
{
	draw_sprite(sButtonA, 0, _x + 20, _y + 4);
	draw_text_transformed(_x + 28, _y + 4, "(Hold)", _s, _s, 0);
}

// Credits/version
draw_set_halign(fa_center);
draw_set_valign(fa_bottom);
draw_text_transformed(96, 168, "ILIAGC: v" + GM_version, _s, _s, 0);
draw_text_transformed(96, 176, "created by nandbolt", _s, _s, 0);