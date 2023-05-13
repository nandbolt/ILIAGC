//
// Green fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

void main()
{
    vec4 color = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
	color.r = 0.0;
	color.b = 0.0;
	color.g = color.g + 0.1 * float(color.g > 0.0);
	
    gl_FragColor = color;
}
