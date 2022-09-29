// Part 1 Testing in 2D first :) 

import peasy.*;
PeasyCam cam;

// ANTS
// 200 x,y => 100 ants

// Vars
int ANT_NUM = 200;
int FOOD_NUM = 100;

float[] ant_pos = new float[ANT_NUM*2];
float[] ant_dir = new float[ANT_NUM];
int ant_num = ANT_NUM;
int DIM = 2;
float ant_speed = 0.07;

// FOOD FARM
int food_num = FOOD_NUM;
float[] food_pos = new float[FOOD_NUM*2];


void genericBox(float x, float y, float z,float size) {
  //translate(300,300,300);
  translate(x,y,z);
  box(size);
  translate(-x,-y,-z);
}

// Java inits to 0 by default so this is the reset function
void init_ants() {
  for (int i = 0; i < ant_num*DIM; i++) {
    ant_pos[i] = 0;
    if ( i < ant_num) ant_dir[i] = random(-PI,PI);
  }
}

void init_food() {
  for (int i = 0; i < food_num*DIM; i++) {
    food_pos[i] = random(30,60);
  }
}


void setup() {
  
  size(600, 600, P3D);
  background(0);
  cam = new PeasyCam(this,100);
  
  // Initialize
  init_food();
  init_ants();
} 

void update_ants() {
  for (int i = 0,j = 0; i < ant_num*DIM; i+=DIM,j++) {
    ant_pos[i] += ant_speed * cos(ant_dir[j]);
    ant_pos[i+1] += ant_speed * sin(ant_dir[j]);
  }
  
  for (int i = 0; i < ant_num; i++) {
    if (int(random(0,5)) == 0) ant_dir[i] += random(-0.3,0.3);
  }
  
}


void draw() {
  background(0);
  // mark ants on the map
  //translate(300,300);
  fill(255);
  for (int i = 0; i < ant_num*DIM; i+=DIM) {
    genericBox(ant_pos[i],ant_pos[i+1],0,1);
  }
  
  fill(#7CF57C);
  for (int i = 0; i < food_num*DIM; i+=DIM) {
    genericBox(food_pos[i],food_pos[i+1],0,4);
  }
  
  update_ants();
  
}
