
let ang = 0;
let flag = true;
let slider;


function setup() {
  createCanvas(400, 400,WEBGL);
  slider = createSlider(0, PI, 0.01, 0.01);
  
}

function draw() {
  
  background(220);
  
  rotateZ(ang);
  rotateX(ang);
  rotateY(ang);
  

  normalMaterial();
  //box(10,10);
  box(1000);
  
  for (let i = -400; i < 400; i+=40) {
    for (let j = -400; j < 400; j+= 40) {
      rect (i,j,20,20);
    }
  } 
  
  //rect(0,0,10,10);
  let t = slider.value();
  ang += t;
  
}