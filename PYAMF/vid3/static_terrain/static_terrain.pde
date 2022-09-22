// Explanation
// Triangle strip

// . . . . .
// . . . . .

// Unify points

int cols,rows;
int point_dist = 20;

int w = 600;
int h = 600;



void setup() {
   size(600,600,P3D);
   
   cols = w/point_dist;
   rows = h/point_dist;
}

void draw() {
   background(0);
   
   stroke(255);
   noFill();
   
   rotateX(PI/4);
   
   for (int x = 0; x < cols; x++) {
     beginShape(TRIANGLE_STRIP);
     for (int y = 0; y < rows; y++) {
       //rect(x*point_dist, y*point_dist,point_dist,point_dist);
       vertex(x*point_dist,y*point_dist);
       vertex((x+1)*point_dist,(y)*point_dist);
     }
     endShape();
   }
   
   
}
