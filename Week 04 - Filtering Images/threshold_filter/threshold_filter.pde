PImage picture;

color colorA;
color colorB;

void setup() {
  size(700, 512);
  background(0);
  picture = loadImage("sample.jpg");
  
  // blue/yellow tones
  colorA = color(2,65,166);
  colorB = color(250,182,47);
}

void draw() {
  image(picture, 0, 0);

  loadPixels();
  for (int i = 0; i < pixels.length; i++) {
    pixels[i] = threshold(pixels[i],100);
  }
  updatePixels();
}

color threshold(color pixel, int threshold) {
   if (red(pixel) > threshold) {
     return color(255);
   } else {
     return color(0);
   }
}  
