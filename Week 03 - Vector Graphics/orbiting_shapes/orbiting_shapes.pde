float anglePlanet = 0;
float angleMoon = 0;
float angleMoon2 = 0;

void setup() {
  size(600, 600); // Larger canvas to space them out
  ellipseMode(CENTER);
}

void draw() {
  background(0);

  translate(width/2, height/2); // Center of canvas

  // --- First: big planet ---
  pushMatrix();
  rotate(radians(anglePlanet));
  fill(200, 50, 255); // Purple
  ellipse(150, 0, 100, 100); // Planet at distance 150

  // --- Second: moon orbiting planet ---
  pushMatrix();
  translate(150, 0); // Move to planet center
  rotate(radians(angleMoon));
  fill(200, 50, 255);
  ellipse(100, 0, 50, 50); // Moon at distance 100 from planet

  // --- Third: smaller moon orbiting moon ---
  pushMatrix();
  translate(100, 0); // Move to moon center
  rotate(radians(angleMoon2));
  fill(200, 50, 255);
  ellipse(60, 0, 20, 20); // Tiny moon at distance 60 from moon
  popMatrix();

  popMatrix();
  popMatrix();

  // --- Update angles ---
  anglePlanet += 1;   // Slow planet rotation
  angleMoon += 3;     // Faster moon rotation
  angleMoon2 += 6;    // Even faster tiny moon rotation
}
