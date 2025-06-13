void setup() {
  size(400, 300);  
}

//The draw() function runs in a loop
void draw() {
  loadPixels();  // Load the current pixel array so it can be modified

  // Loop over every pixel column (x-axis)
  for (int x = 0; x < width; x++) {
    // Loop over every pixel row (y-axis)
    for (int y = 0; y < height; y++) {
      // Normalize the x-coordinate to a 0–1 range
      float normalizedX = map(x, 0, width - 1, 0, 1);

      // Compute the red channel based on normalized x (left = 0, right = 255)
      int red = int(255 * normalizedX);

      // Compute the green channel as a sine wave across the x-axis for smooth variation
      int green = int(255 * abs(sin(normalizedX * PI)));

      // Compute the blue channel inversely proportional to x (left = 255, right = 0)
      int blue = int(255 * (1 - normalizedX));

      // Create a colour from the red, green, and blue components
      color c = color(red, green, blue);

      // Set the pixel at position (x, y) to the computed colour
      pixels[x + y * width] = c;
    }
  }

  updatePixels();  // Apply the changes to the screen
}
