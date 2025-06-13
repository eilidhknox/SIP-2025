float[] angles = {0, 0, 0, 0, 0};
float[] speeds = {1, 25, 10, 5, 2};

float xpos = 80;
float xstep = 60;

void setup() {
  size(400, 400);
  rectMode(CENTER);
}

void draw() {
  background(0);

  for (int i = 0; i < angles.length; i++) {
    pushMatrix();

    // Use switch to set fill colour
    switch (i) {
      case 0:
        fill(255, 0, 0);   // Red
        break;
      case 1:
        fill(0, 255, 0);   // Green
        break;
      case 2:
        fill(0, 0, 255);   // Blue
        break;
      case 3:
        fill(255, 255, 0); // Yellow
        break;
      case 4:
        fill(255, 0, 255); // Magenta
        break;
    }

    translate(xpos + (xstep * i), height / 2);
    rotate(radians(angles[i]));
    rect(0, 0, 50, 50);

    angles[i] = angles[i] + speeds[i];

    popMatrix();
  }
}
