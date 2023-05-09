//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
	// Invert color
	vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	color.r = 1.0 - color.r;
	color.g = 1.0 - color.g;
	color.b = 1.0 - color.b;
	
	// Set color
    gl_FragColor = color;
}
