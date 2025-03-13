//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_time;

void main()
{
    // vec4 rightPxl = texture2D(gm_BaseTexture, v_vTexcoord + vec2(1, 0));
    // vec4 leftPxl = texture2D(gm_BaseTexture, v_vTexcoord + vec2(-1, 0));
    // vec4 topPxl = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0, -1));
    // vec4 bottomPxl = texture2D(gm_BaseTexture, v_vTexcoord + vec2(0, 1));
    vec4 texColour = texture2D(gm_BaseTexture, v_vTexcoord);
    
    // if ((leftPxl.rgba == vec4(0,0,0,0) || rightPxl.rgba == vec4(0,0,0,0) || topPxl.rgba == vec4(0,0,0,0) || bottomPxl.rgba == vec4(0,0,0,0)) && texColour.a != 0.0) {
    if (texColour.a != 0.0) {
       gl_FragColor = vec4(abs(sin(u_time)), abs(cos(u_time)), texColour.b, 1.0);
    }

}