PImage img;

void setup() {
  
  size(700,512);
  // Load the image first
  img = loadImage("sample.jpg");
  
  img.loadPixels();
  for (int i = 0; i < img.pixels.length; i++) {
    color c = img.pixels[i];
    float r = red(c);
    float g = green(c);
    float b = blue(c);
    
    // Swap color channels (RGB → BGR)
    img.pixels[i] = color(b, g, r);
  }
  img.updatePixels();
  image(img, 0, 0);
  
}
