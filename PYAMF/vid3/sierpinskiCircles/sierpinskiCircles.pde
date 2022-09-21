

void setup() {
  size(640,600);
}

void draw() {
  translate(0,0);
  background(0);
  
  for (int i = 300; i >2; i-=i/5+1) {
    funcCall(width/2,height/2-300+i,i);
  }
  
  //funcCall(width/2,height/2,300);
  //funcCall(width/2,height/2-10,299);
}

void funcCall(float x, float y, float d) {
  stroke(190);
  noFill();
  ellipse(x,y,d,d);
  if (d>2) {
    funcCall(x+d/2,y,d/2);
    funcCall(x-d/2,y,d/2);
    funcCall(x,y+d/2,d/2);
  }
}
