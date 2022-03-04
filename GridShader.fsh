#ifdef GL_ES
precision mediump float;
#endif
uniform sampler2D src;

uniform vec2 qt_Matrix;
uniform vec2 u_Resolution;
//uniform float qt_Timestamp;
uniform lowp float iGlobalTime;
const int factor = 20;  //px
void main(){
    vec2 st = gl_FragCoord.xy;
    vec3 color = vec3(0.0);
    float xTime = iGlobalTime ;
    xTime = iGlobalTime * 4;

    float pct = 0.0;
    if(!(int(st.x) % factor == 0 || int(st.y) % factor == 0 ))
    {
        discard;
        return;
    }
    else
        pct = 1.0;
    color = vec3(pct);
    color*= vec3(abs(sin(xTime)),abs(cos(xTime)),abs(sin(xTime)));

    gl_FragColor = vec4(color,1.0);
}
