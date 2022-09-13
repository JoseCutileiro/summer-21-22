// noprotect

var r = 0;

var cred = 255;
var cgreen = 255;
var cblue = 255;

var c = 0;

function branch(len) {
  line(0,0,0,-len)
  translate(0,-len);

  if (len > 2) {
    // Lado 1
    push();
    r += random(-0.001,0.001);
    rotate(ang1.value()+r);
    branch(len*len1.value());
    pop();
    
    // Lado 2
    push();
    r += random(-0.001,0.001);
    rotate(-ang2.value())+r;
    branch(len*len2.value());
    pop();
  }
}


function setup() {
  createCanvas(400,400);
  stroke(255);

  len1 = createSlider(0, 0.67, 0, 0.01);
  len2 = createSlider(0, 0.67, 0, 0.01);
  
  ang1 = createSlider(0, PI/2, 0, 0.01);
  ang2 = createSlider(0, PI/2, 0, 0.01);
}

function draw() {
  
  background(51);
  // change og
  translate(200,height);
  branch(100);

  

}