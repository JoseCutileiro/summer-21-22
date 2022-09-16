import peasy.*;

int DIM = 32;
int scale = 100;
PeasyCam cam;

// optimize calculations
ArrayList<PVector> mandelPoints = new ArrayList<PVector>(); 

void setup2() {
  size(600,600,P3D);
  cam = new PeasyCam(this,500);
}

class Spherical{
  float r;
  float teta;
  float fi;
  Spherical(float r, float teta, float fi) {
    this.r = r; 
    this.teta = teta;
    this.fi = fi;
  }
}

Spherical spherical(float x, float y, float z) {
   float r = sqrt(x*x + y*y + z*z);
   float teta = atan2(sqrt(x*x+y*y),z);
   float fi = atan2(y,x);
   return new Spherical(r,teta,fi);
}



void setup() {
  
  size(600,600,P3D);
  cam = new PeasyCam(this,500);
  
  background(0);
  for (int i = 0; i < DIM; i++) {
    for (int j = 0; j < DIM; j++) {
      for (int k = 0; k < DIM; k++) {
        float x = map(i,0,DIM,-1,1);
        float y = map(j,0,DIM,-1,1);
        float z = map(k,0,DIM,-1,1);
        
        // change to spherical coords
        // note: atan <=> arctan
        float r = sqrt(x*x + y*y + z*z);
        float teta = atan2(sqrt(x*x+y*y),z);
        float phi = atan2(y,x);
        
        PVector zeta = new PVector(0,0,0);
        int n = 8;
        
        int iter = 0;
        while (iter < 20) {
          Spherical c = spherical(x,y,z);
          float newx = pow(c.r,n) * sin(c.teta*n) * cos(c.fi*n);
          float newy = pow(c.r,n) * sin(c.teta*n) * cos(c.fi*n);
          float newz = pow(c.r,n) * cos(c.teta*n);
          
          zeta.x = newx + x;
          zeta.y = newx + y;
          zeta.z = newx + z;
          
          
          iter++;
          log(c.r);
          if (c.r > 16) {
            
            break;
          }
        }
        if (iter == 20) {
          mandelPoints.add(new PVector(x*scale,y*scale,z*scale));
        }
        stroke(200);
        point(x*scale,y*scale,z*scale);
      }
    }
  }
}

void draw() {
  background(0);
  for (PVector v : mandelPoints) {
    point(v.x,v.y,v.z);
  }
}
