
#ifdef GL_ES
precision mediump float;
#endif

uniform vec2 qt_Matrix;
uniform vec2 u_Resolution;
//uniform float qt_Timestamp;
uniform lowp float iGlobalTime;
void main(){
    vec2 st = gl_FragCoord.xy/u_Resolution;
    vec3 color = vec3(0.0);
    float xTime = iGlobalTime ;
    xTime = iGlobalTime *10;

    float squarSize=0;
    // bottom-left
    vec2 bl = step(vec2(squarSize),st);
    float pct = bl.x * bl.y;

    // top-right
    vec2 tr = step(vec2(squarSize),1.0-st);
    pct *= tr.x * tr.y;

    color = vec3(pct);
    color*=vec3(abs(sin(xTime)),abs(cos(xTime)),abs(sin(xTime)));

    gl_FragColor = vec4(color,1.0);
}
