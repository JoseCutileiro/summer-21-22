import peasy.*;

// CAMERA 
PeasyCam cam;


// ANT BASE ATRIBUTES
float ANT_SPEED = 0.3;
int ANT_NUM = 100;
float ANT_SIZE = 1;
Ant[] Ants = new Ant[ANT_NUM];

// GenericBoxFuntion
void genericBox(float x, float y, float z,float size) {
  //translate(300,300,300);
  translate(x,y,z);
  box(size);
  translate(-x,-y,-z);
}

class Ant {
  float x,y,angle;
  Ant (float _x,float _y, float _angle) {
    x = _x;
    y = _y;
    angle = _angle;
  }
  
  Ant() {
    x = 0;
    y = 0; 
    angle = random(-PI,PI);
  }
  
   void update() {
    x += ANT_SPEED * cos(angle);
    y += ANT_SPEED * sin(angle);
    angle += random(-0.3,0.3);
    genericBox(x,y,30,ANT_SIZE);
  }
}

class Food {
  
}



void setup() {
  size(600, 600, P3D);
  background(0);
  cam = new PeasyCam(this,100);
  
  for (int i = 0; i < ANT_NUM; i++) {
    Ant new_ant = new Ant();
    Ants[i] = new_ant;
  }
  
}

void draw() {
  
  //background(0);
  
  for (int i = 0; i < ANT_NUM; i++) {
    Ants[i].update();
  }
}
