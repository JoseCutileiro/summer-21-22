var timev = 2;
var check = 1;

var vvalor = 10;

function update_my() {
  for (var x = 0; x < width; x++) {
      for (var y = 0; y < height; y++) {
        var pix = (x+y * width) * 4;
        
        // Valid numbers between -2 and 2
        
        var a = map(x, 0, width, -2.5,2.5);
        var b = map(y, 0,height,-2.5,2.5);
        
        
        var n = 0;
        var z = 0;
        oga = a;
        ogb = b;
        
        while (n < vvalor) {
          var real = a*a - b*b;
          var imag = 2*a*b;
          
          a = real + oga;
          b = imag + ogb;
          
          
          if (abs(a+b) > timev) {
            break;
          }
          n++;
        }
        
        var bright = map(n,0,vvalor,0,255); 
        
        if (n === vvalor) {
          bright = 0;
        }
        
        // RANGE: 0 e 255
        // RGB and opacity
        pixels[pix + 0] = bright;
        pixels[pix + 1] = bright;
        pixels[pix + 2] = bright;  
        pixels[pix + 3] = 255;
      }
    }
  updatePixels();
}

function setup() {
  createCanvas(400, 400);
  pixelDensity(1);
  loadPixels();
  update_my();
}

function draw() {
  timev += 0.1*check;
  if (timev < 2 || timev < 0) {
    check *= -1;
  }
  update_my();
}