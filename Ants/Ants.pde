// Part 1 Testing in 2D first :) 

import peasy.*;
PeasyCam cam;

// ANTS
// 200 x,y => 100 ants
float[] ant_pos = new float[200];
int ant_num = 100;
int DIM = 2;

// FOOD FARM



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
  }
}

void setup() {
  
  size(600, 600, P3D); background(0);
  cam = new PeasyCam(this,500);
} 

void draw() {
  background(0);
  // mark ants on the map
  for (int i = 0; i < ant_num*DIM; i+=DIM) {
    genericBox(ant_pos[i],ant_pos[i+1],random(-40,40),4);
  }
  
  
}
