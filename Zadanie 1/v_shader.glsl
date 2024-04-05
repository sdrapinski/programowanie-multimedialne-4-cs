#version 330

//Zmienne jednorodne
uniform mat4 P;
uniform mat4 V;
uniform mat4 M;

//Atrybuty
in vec4 vertex; //wspolrzedne wierzcholka w przestrzeni modelu
in vec4 normal; //wektor normalny w przestrzeni modelu
in vec4 color; //kolor skojarzony z wierzcho³kiem
in vec2 texCoord; //wspó³rzêdna teksturowana

out vec4 i_c;
vec4 light=vec4(0,0,-6,1);

void main(void) {
    vec4 l =normalize(V*light-V*M*vertex);
    vec4 normal2 = normalize(V*M*normal);
    vec4 black = vec4(0,0,0,1);
    vec4 white = vec4(1,1,1,1);
    vec4 L= color*black+color*white*dot(l,normal2);
    i_c=L;
    gl_Position=P*V*M*vertex;
}
