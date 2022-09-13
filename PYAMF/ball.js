var timev = 0;
var check = 1;

function setup() {
  createCanvas(400, 400);
  pixelDensity(1);
  loadPixels();
  
  for (var x = 0; x < width; x++) {
      for (var y = 0; y < height; y++) {
        var pix = (x+y * width) * 4;
        
        // Valid numbers between -2 and 2
        
        var a = map(x, 0, width, -2,2);
        var b = map(y, 0,height,-2,2);
        
        
        var n = 0;
        var z = 0;
        
        
        while (n < 100) {
          var real = a*a - b*b;
          var imag = 2*a*b;
          
          a = real;
          b = imag;
          
          
          if (abs(a+b) > timev) {
            break;
          }
          n++;
        }
        
        var bright = 0; 
        if (n === 100) {
          bright = 255;
        }
        
        
        // RANGE: 0 e 255
        // red
        pixels[pix + 0] = bright;
        
        // green
        pixels[pix + 1] = bright;
        
        // blue
        pixels[pix + 2] = bright;
        
        // tranparency
        pixels[pix + 3] = 255;
      }
    }
  updatePixels();
}

function draw() {
  timev += 0.1*check;
  if (timev > 2 || timev < 0) {
    check *= -1;
  }
  console.log(timev);
  createCanvas(400, 400);
  pixelDensity(1);
  loadPixels();
  
  for (var x = 0; x < width; x++) {
      for (var y = 0; y < height; y++) {
        var pix = (x+y * width) * 4;
        
        // Valid numbers between -2 and 2
        
        var a = map(x, 0, width, -2,2);
        var b = map(y, 0,height,-2,2);
        
        
        var n = 0;
        var z = 0;
        
        
        while (n < 100) {
          var real = a*a - b*b;
          var imag = 2*a*b;
          
          a = real;
          b = imag;
          
          
          if (abs(a+b) > timev) {
            break;
          }
          n++;
        }
        
        var bright = 0; 
        if (n === 100) {
          bright = 255;
        }
        
        
        // RANGE: 0 e 255
        // red
        pixels[pix + 0] = bright;
        
        // green
        pixels[pix + 1] = bright;
        
        // blue
        pixels[pix + 2] = bright;
        
        // tranparency
        pixels[pix + 3] = 255;
      }
    }
  updatePixels();
}