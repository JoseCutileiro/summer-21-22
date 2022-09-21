float ang  = 0; 

void genericBox(int size, float x, float y, float z) {
   translate(x,y,z);
   box(size);
   translate(-x,-y,-z);
}

void setup() {
  size(600, 600, P3D); background(0);
} 

void draw() { 
  translate(300,300);
  
  //background(0);
  for (int i = 0; i < 100; i+= 10) {
      if (ang > 10 && i == 60) {
      stroke(255);
      fill(#3CF500);
      }
            
       if (ang > 0 && i == 70) {
      stroke(255);
      fill(#E8B90E);
      }
            
    
    
      if (ang > 0 && i == 80) {
      stroke(255);
      fill(#F73260);
      }
      
      if (ang > 0 && i == 90) {
      stroke(255);
      fill(#00F2E0);
      }
      
      if (ang > 0 && i == 100) {
      stroke(255);
      fill(0);
      }
      genericBox(10,i,i,i); 
      stroke(0);
      fill(255);
    
     
     
     rotateZ(ang);
     rotateY(ang);
     rotateX(ang);
     println(ang);
  }
  ang += 0.01;
  
  
  if (ang > 10) {
    stroke(255);
    fill(0);
  }
  
  if (ang > 6) noLoop() ;
  
  
}
