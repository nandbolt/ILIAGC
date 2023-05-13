//
// Aqua fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	bool grey = (color.r == color.g) && (color.r == color.b);
	if (grey)
	{
		color.r = 0.0;
		color.g = min(color.g, 0.5);
	}
	
    gl_FragColor = color;
}
