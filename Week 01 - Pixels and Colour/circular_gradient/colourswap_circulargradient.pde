void setup() {
  size(400, 300);
}

void draw() {
  loadPixels();
  
  float centerX = width / 2;
  float centerY = height / 2;
  float maxDist = dist(0, 0, centerX, centerY);

  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      
      float d = dist(x, y, centerX, centerY);
      float normalizedD = map(d, 0, maxDist, 0, 1);

      int red = int(255 * (1 - normalizedD));
      int green = 0;
      int blue = int(255 * normalizedD);

      color c = color(red, green, blue);
      pixels[x + y * width] = c;
    }
  }
  
  updatePixels();
}
