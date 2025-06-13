void setup() {
  size(400, 300); 
}

void draw() {
  loadPixels();  // Load the current pixel array so it can be modified

  // Loop over every pixel column (x-axis)
  for (int x = 0; x < width; x++) {
    // Loop over every pixel row (y-axis)
    for (int y = 0; y < height; y++) {
      // Normalize the y-coordinate to a 0–1 range
      float normalizedY = map(y, 0, height - 1, 0, 1);

      // Compute the red channel based on normalized y (top = 0, bottom = 255)
      int red = int(255 * normalizedY);

      // Set green to 0
      int green = 0;

      // Compute the blue channel inversely proportional to y (top = 255, bottom = 0)
      int blue = int(255 * (1 - normalizedY));

      // Create a colour from the red, green, and blue components
      color c = color(red, green, blue);

      // Set the pixel at position (x, y) to the computed colour
      pixels[x + y * width] = c;
    }
  }

  updatePixels();  
}
