//
// Rainbow fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_uv;
uniform float u_speed;
uniform float u_time;
uniform float u_saturation;
uniform float u_brightness;
uniform float u_section;
uniform float u_mix;

vec3 hsv2rgb(vec3 c)
{
	vec4 K = vec4(1.0, 2.0 / 3.0, 1.0 / 3.0, 3.0);
	vec3 p = abs(fract(c.xxx + K.xyz) * 6.0 - K.www);
	return c.z * mix(K.xxx, clamp(p - K.xxx, 0.0, 1.0), c.y);
}

void main()
{
	float pos = (v_vTexcoord.x - u_uv[0]) / (u_uv[1] - u_uv[0]);
    vec4 texColor = texture2D(gm_BaseTexture, v_vTexcoord);
    
    vec3 col = vec3(u_section * ((u_time * u_speed) + pos), u_saturation, u_brightness);
	vec4 finalCol = mix(texColor, vec4(hsv2rgb(col), texColor.a), u_mix);
    
    gl_FragColor = v_vColour * finalCol;
}
