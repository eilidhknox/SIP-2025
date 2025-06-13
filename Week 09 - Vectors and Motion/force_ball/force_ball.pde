class Ball {
  PVector position;
  PVector velocity;
  PVector acceleration;
  
  color c;
  float mass;
  int radius = 2;

  Ball(float x, float y, float m) {
    position = new PVector(x, y);
    velocity = new PVector(0, 0);
    acceleration = new PVector(0,0);

    mass = m;
    c = color(random(255),random(255),random(255));
  }
  
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }

  void update() {
    velocity.add(acceleration);
    position.add(velocity);
    checkEdges();
    acceleration.mult(0);
  }

  void display() {
    strokeWeight(2);
    stroke(64);
    fill(c);
    circle(position.x, position.y, mass*radius*2);
  }

  void checkEdges() {
    if ((position.x+radius > width) || (position.x-radius < 0)) {
      velocity.x = velocity.x * -1;
      if (position.x+radius > width) {
        position.x = width-radius;
      } else {
        position.x = radius;
      }
    }
    if ((position.y+radius > height) || (position.y-radius < 0)) {
      velocity.y = velocity.y * -1;
      if (position.y+radius > height) {
        position.y = height-radius;
      } else {
        position.y = radius;
      }
    }
  }
}

Ball[] balls;
int ballCount = 10;

PVector gravity;
PVector wind;

void setup() {
  size(800, 400);
  balls = new Ball[ballCount];
  for (int i = 0; i < balls.length; i++) {
    balls[i] = new Ball(random(width), 100, random(1,20));
  }

  gravity = new PVector(0, 0.5);
  wind = new PVector(0.04, 0);
}

void draw() {
  background(230);

  for (Ball b : balls) {
    PVector g = gravity.copy().mult(b.mass);
    b.applyForce(g);
    b.applyForce(wind);
    if (mousePressed) {
      b.applyForce(wind);
    }

    b.update();
    b.display();
  }
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
}
