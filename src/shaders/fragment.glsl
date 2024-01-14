varying vec2 vuv;

uniform float uTime;

#define PI 3.14159265

float random(vec2 st) {
    return fract(sin(dot(st.xy, vec2(12.9898, 78.233))) * 43758.5453123);
}

vec2 rotate(vec2 uv, float rotation, vec2 mid) {
return vec2(
      cos(rotation) * (uv.x - mid.x) + sin(rotation) * (uv.y - mid.y) + mid.x,
      cos(rotation) * (uv.y - mid.y) - sin(rotation) * (uv.x - mid.x) + mid.y
    );
}
    
void main()
{
    float distance = length(vec2(0.5, 0.5) - vuv);
    vec3 pink = vec3(0.9, 0.2, 0.6);
    vec3 purple = vec3(0.6, 0.2, 0.9);
    vec3 blue = vec3(0.3, 0.6, 0.9);
    vec3 color = vec3(0.0);
    float circleValuePink = step(distance, 0.1 + abs(sin(uTime)) * 0.25);
    float circleValuePurple = step(distance, 0.06 + abs(sin(uTime)) * 0.20);
    float circleValueBlue = step(distance, 0.02 + abs(sin(uTime)) * 0.10);
    color = mix(color, pink, circleValuePink);
    color = mix(color, purple, circleValuePurple);
    color = mix(color, blue, circleValueBlue);
    gl_FragColor = vec4(color, 1.0);
}

