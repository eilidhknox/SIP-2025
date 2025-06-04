void setup() {
  size(400, 300);
}

void draw() {
  loadPixels();
  for (int x = 0; x < width; x++) {
    for (int y = 0; y < height; y++) {
      float normalizedY = map(y, 0, height - 1, 0, 1);
      
      int red = int(255 * normalizedY);
      int green = 0;
      int blue = int(255 * (1 - normalizedY));

      color c = color(red, green, blue);
      pixels[x + y * width] = c;
    }
  }
  updatePixels();
}
