void setup() {
  size(400, 300);  
}

void draw() {
  loadPixels();  // Load the current pixel array so it can be modified

  // Loop over every pixel column (x-axis)
  for (int x = 0; x < width; x++) {
    // Loop over every pixel row (y-axis)
    for (int y = 0; y < height; y++) {
      // Normalize the x-coordinate to a 0–1 range
      float normalizedX = map(x, 0, width - 1, 0, 1);

      // Compute the red channel to decrease from left (255) to right (0)
      int red = int(255 * (1 - normalizedX));

      // Set green to full intensity (255) across the entire width
      int green = 255;

      // Set blue to 0 
      int blue = 0;

      // Create a colour from the red, green, and blue components
      color c = color(red, green, blue);

      // Set the pixel at position (x, y) to the computed colour
      pixels[x + y * width] = c;
    }
  }

  updatePixels();  
}
