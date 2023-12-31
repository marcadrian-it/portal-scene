uniform float uPixelRatio;
uniform float uSize;
uniform float uTime;

attribute float aScale;

void main(){
    vec4 modelPosition = modelMatrix * vec4(position, 1.0);
    modelPosition.y += sin(uTime + modelPosition.x * 10.0) * 0.1 * aScale;

    vec4 viewPosition = viewMatrix * modelPosition;
    vec4 projectionPosition = projectionMatrix * viewPosition;

    gl_Position = projectionPosition;
    gl_PointSize = uSize * aScale * uPixelRatio;
    gl_PointSize *= (1.0 / -viewPosition.z);

    float threshold = 10.0;
    if(gl_PointSize < threshold) {
        gl_PointSize = threshold;
    }
}