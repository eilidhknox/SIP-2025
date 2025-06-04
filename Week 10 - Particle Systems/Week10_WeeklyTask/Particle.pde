class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  
  float lifespan;
  float size;
  
  int startColor;
  int endColor;
  
  Particle(PVector pos) {
    location = pos.copy();
    
    velocity = new PVector(random(-1, 1), random(1, 3));
    acceleration = new PVector(0, 0);
    
    size = random(10, 20);
    
    startColor = color(50, 200, 50);
    endColor   = color(255, 100, 0);
    
    lifespan = 255;
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
    acceleration.mult(0);
    lifespan -= 1.5;
  }
  
  void display() {
    pushMatrix();
    translate(location.x, location.y);
    rotate(radians(frameCount + location.x * 0.1));
    
    noStroke();
    int currentColor = lerpColor(startColor, endColor, map(lifespan, 255, 0, 0, 1));
    fill(currentColor, lifespan);
    
    ellipse(0, 0, size, size * 0.5);
    
    popMatrix();
  }
  
  boolean isOffScreen() {
    return (location.y > height || lifespan < 0);
  }
}
