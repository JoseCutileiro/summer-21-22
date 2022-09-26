import peasy.*;

float t = 0.1;
PeasyCam cam;

void genericBox(float x, float y, float z,float size) {
  translate(x,y,z);
  box(size);
  translate(-x,-y,-z);
}

void setup() {
  translate(300,300,0);
  size(600, 600, P3D); background(0);
  cam = new PeasyCam(this,500);
} 

void draw() {
  background(0);
  //genericBox(t,t,t,10);
  for (float x = -100; x < 100; x += 3) {
    for (float y = -100; y < 100; y += 3) {
      float nx = map(x*0.0174533,0,100*0.0174533,-8,8);
      float ny = map(y*0.0174533,0,100*0.0174533,-8,8);
      //print(cos(nx)+cos(ny)+"\n");
      genericBox(x,y,map((cos(nx+t)+cos(ny+t)),-2,2,-50,50),8);
    }
  }
  
  t += 0.1;
}
