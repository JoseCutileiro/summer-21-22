import peasy.*;

// CAMERA 
PeasyCam cam;


// ANT BASE ATRIBUTES
float ANT_SPEED = 0.3;
int ANT_NUM = 500;
float ANT_SIZE = 1;
Ant[] Ants = new Ant[ANT_NUM];

// FOOD BASE ATRIBUTES
float FOOD_SIZE = 3;
int FOOD_NUM = 300;
Food[] Foods = new Food[FOOD_NUM];

// HORMONA IR GROUP
int hormona_ir_index = 0;
int HORMONA_IR_MAX_INDEX = 1;//ANT_NUM*20;
float HORMONA_SPEED = 0.1;
Ant_hormona_ir[] HormonasIR = new Ant_hormona_ir[HORMONA_IR_MAX_INDEX];

// COLLISION HANDLE 
int[] cord_ants = new int[ANT_NUM];
int[] cord_food = new int[FOOD_NUM];


// GenericBoxFuntion
void genericBox(float x, float y, float z,float size) {
  //translate(300,300,300);
  translate(x,y,z);
  box(size);
  translate(-x,-y,-z);
}

class Ant_hormona_ir {
  float x,y,angle,time;
  float cri_x,cri_y;
  
  Ant_hormona_ir (float _x,float _y,float _angle) {
    x = _x;
    y = _y;
    cri_x = _x;
    cri_y = _y;
    angle = _angle;
    time = random(200,400);
  }
  
  void update() {
    angle += random(-0.1,0.1);
    time -= 1;
    x += cos(angle)*HORMONA_SPEED;
    y += sin(angle)*HORMONA_SPEED;
    if (time > 0) {
      genericBox(x,y,30,0.5);
    }
  } 
}


class Ant {
  float x,y,angle;
  
  boolean hormona_ir;
  
  Ant (float _x,float _y, float _angle) {
    x = _x;
    y = _y;
    angle = _angle;
    hormona_ir = true;
  }
  
  Ant() {
    x = 0;
    y = 0; 
    angle = random(-PI,PI);
    hormona_ir = true;
  }
  
   void update() {
    x += ANT_SPEED * cos(angle);
    y += ANT_SPEED * sin(angle);
    angle += random(-0.3,0.3);
    genericBox(x,y,30,ANT_SIZE);
  }
  
  void criar_hormona() {
    
    if (hormona_ir) {
      hormona_ir_index += 1;
      if (hormona_ir_index == HORMONA_IR_MAX_INDEX) {
        hormona_ir_index = 0;
      }
      HormonasIR[hormona_ir_index] = new Ant_hormona_ir(x,y,-angle);
    }
    else {
    }
  }
  
  void procura_comida() {
    hormona_ir = true;
  }
  
  void volta_pa_casa() {
    hormona_ir = false;
  }
  
   int get_cord_code() {
     // Se já tiver comida
     if (!hormona_ir) {
       return 0;
     }
     
    return int(x*1000 + y);
  }
  
}

class Food {
  float x,y;
  boolean TAKEN;
  Food (float _x,float _y) {
    x = _x;
    y = _y;
    TAKEN = false;
  }
  
  Food () {
    x = random(-100,100);
    y = random(-100,100);
    
    while (abs(x) + abs(y) < 130) {
      x = random(-100,100);
      y = random(-100,100); 
    }
    TAKEN = false;
  }
  
  void update() {
    if (!TAKEN) {
      genericBox(x,y,30,FOOD_SIZE);
    }
  }
  
  void take() {
    TAKEN = true;
  }
  
  int get_cord_code() {
    return int(x*1000 + y);
  }
  
  void consume() {
    x = 10000;
    y = 10000;
  }
  
}



void setup() {
  size(600, 600, P3D);
  background(0);
  cam = new PeasyCam(this,100);
  
  for (int i = 0; i < ANT_NUM; i++) {
    Ant new_ant = new Ant();
    Ants[i] = new_ant;
  }
  for (int i = 0; i < FOOD_NUM; i++) {
    Food new_food = new Food();
    Foods[i] = new_food;
  }
   for (int i = 0; i < HORMONA_IR_MAX_INDEX; i++) {
    Ant_hormona_ir new_ant_hormona_ir = new Ant_hormona_ir(1000,1000,0);
    HormonasIR[i] = new_ant_hormona_ir;
  }
}

void draw() {
  background(0);
  
  // UPDATE ALL ANTS
  fill(255);
  for (int i = 0; i < ANT_NUM; i++) {
    Ants[i].update();
    
    if (int(random(0,20)) == 0) {
      Ants[i].criar_hormona();
      cord_ants[i] = Ants[i].get_cord_code();
    }
  }
  
  // UPDATE ALL FOODS
  fill(#00FF00);
  for (int i = 0; i < FOOD_NUM; i++) {
    Foods[i].update();
    cord_food[i] = Foods[i].get_cord_code();
  }
  
  // UPDATE HORMONA IR
  fill(#FF0000);
  for (int i = 0; i < HORMONA_IR_MAX_INDEX; i++) {
    HormonasIR[i].update();
  }
  
  // CHECK COLLISIONS
  for (int i = 0; i < ANT_NUM; i++) {
    for (int j = 0; j < FOOD_NUM; j++) {
      // UMA FORMIGA ENCONTROU UMA COMIDA
      print("COMIDA: ");
      print(cord_food[j]);
      print("\n");
      int dx = (cord_food[j]/1000 - cord_ants[i]/1000);
      int dy = (cord_food[j]%100 - cord_ants[i]%100);
      if (sqrt(dx*dx + dy*dy) > -1) {
        //Foods[j].consume();
      }
    }
  }
  
}
