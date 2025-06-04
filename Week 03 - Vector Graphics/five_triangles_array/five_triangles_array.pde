float[] angles = {0, 0, 0, 0, 0};
float[] speeds = { 1, 25, 10, 5, 2};

float xpos = 80;
float xstep = 60;

void setup() {
  size(400, 400);
  rectMode(CENTER);
}

void draw() {
  background(0);
  
  for(int i = 0; i<angles.length; i++) {
    pushMatrix();
    fill(152, 50, 204);
    translate(xpos + (xstep*i), height/2);
    rotate(radians(angles[i]));
    rect(0, 0, 50, 50);
    angles[i] = angles[i] + speeds[i];
   popMatrix(); 
  }
}
