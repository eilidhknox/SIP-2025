// Space Escape Game — FINAL VERSION
// Player chaos + Enemy chaser movement + Chaser ship shape + Sound + Full game
// by [Your Name / Pair]

// Import Processing Sound library
import processing.sound.*;

// Sound oscillators
SinOsc sine;
SawOsc saw;

// Forces
PVector gravity = new PVector(0, 0.1);
PVector wind = new PVector(0.03, 0);  // subtle push

// Player class
class Player {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float size = 30;
  
  Player(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
  }
  
  void applyForce(PVector force) {
    acceleration.add(force);
  }
  
  void update() {
    velocity.add(acceleration);
    
    // Add SMALL random jitter to make it a bit chaotic
    float jitterAmount = 0.1;  // Tweak this
    velocity.x += random(-jitterAmount, jitterAmount);
    velocity.y += random(-jitterAmount, jitterAmount);
    
    // Apply drag — keeps some momentum
    float drag = 0.97;
    velocity.mult(drag);
    
    position.add(velocity);
    acceleration.mult(0);
    checkEdges();
  }
  
  void display() {
    fill(0, 200, 255);
    stroke(255);
    ellipse(position.x, position.y, size, size);
  }
  
  void checkEdges() {
    if (position.x < 0) {
      position.x = 0;
      velocity.x *= -0.5;
    }
    if (position.x > width) {
      position.x = width;
      velocity.x *= -0.5;
    }
    if (position.y < 0) {
      position.y = 0;
      velocity.y *= -0.5;
    }
    if (position.y > height) {
      position.y = height;
      velocity.y *= -0.5;
    }
  }
}

// Enemy class modeled on your Chaser class
class Enemy {
  PVector position;
  PVector velocity;
  PVector acceleration;
  float heading;
  color col;
  
  Enemy(float x, float y) {
    position = new PVector(x, y);
    velocity = new PVector();
    acceleration = new PVector();
    col = color(255, 0, 0);  // red enemies
  }
  
  void update(Player target) {
    // Seek toward player
    PVector direction = PVector.sub(target.position, position);
    direction.normalize();
    direction.mult(0.2);  // how strongly it turns
    
    acceleration = direction;
    
    // Add jitter to acceleration → more chaotic
    float jitterAmount = 0.5;
    acceleration.x += random(-jitterAmount, jitterAmount);
    acceleration.y += random(-jitterAmount, jitterAmount);
    
    velocity.add(acceleration);
    velocity.limit(5);  // max speed
    
    heading = velocity.heading() + PI/2;
    
    position.add(velocity);
  }
  
  void display() {
    stroke(64);
    strokeWeight(2);
    fill(col);
    
    pushMatrix();
    translate(position.x, position.y);
    rotate(heading);
    
    // Asteroids ship shape
    beginShape();
    vertex(0, -20);
    vertex(15, 10);
    vertex(0, 0);
    vertex(-15, 10);   
    endShape(CLOSE);
    
    popMatrix();
  }
  
  boolean checkCollision(Player p) {
    float d = PVector.dist(position, p.position);
    return d < (p.size/2 + 15);  // Approximate ship size
  }
}

// Game state
Player player;
Enemy[] enemies;
int enemyCount = 3;

boolean gameOver = false;
int score = 0;
int timer = 0;

void setup() {
  size(800, 600);
  
  player = new Player(width/2, height/2);
  
  enemies = new Enemy[enemyCount];
  for (int i = 0; i < enemyCount; i++) {
    enemies[i] = new Enemy(random(width), random(height));
  }
  
  score = 0;
  timer = 0;
  gameOver = false;
  
  // Setup sound
  sine = new SinOsc(this);
  saw = new SawOsc(this);
  
  sine.freq(200);
  sine.amp(0.3);
  sine.play();
  
  saw.freq(100);
  saw.amp(0.2);
  saw.play();
}

void draw() {
  background(30);
  
  if (!gameOver) {
    // Apply forces
    player.applyForce(gravity);
    player.applyForce(wind);
    
    // Movement input
    boolean moving = false;
    float moveForce = 0.3;
    
    if (keyPressed) {
      if (keyCode == LEFT) {
        player.applyForce(new PVector(-moveForce, 0));
        moving = true;
      }
      if (keyCode == RIGHT) {
        player.applyForce(new PVector(moveForce, 0));
        moving = true;
      }
      if (keyCode == UP) {
        player.applyForce(new PVector(0, -moveForce));
        moving = true;
      }
      if (keyCode == DOWN) {
        player.applyForce(new PVector(0, moveForce));
        moving = true;
      }
    }
    
    // Update player
    player.update();
    player.display();
    
    // Update enemies
    for (Enemy e : enemies) {
      e.update(player);
      e.display();
      
      if (e.checkCollision(player)) {
        gameOver = true;
        
        // Change sound on game over
        sine.freq(100);
        saw.freq(50);
        sine.amp(0.5);
        saw.amp(0.5);
      }
    }
    
    // Update score
    timer++;
    if (timer % 60 == 0) {
      score++;
    }
    
    // Display score
    fill(255);
    textSize(20);
    text("Score: " + score, 10, 30);
    
    // Modulate sound
    float mod = sin(frameCount * 0.01);
    sine.freq(200 + mod * 50);
    saw.freq(100 + mod * 30);
    
    // Adjust volume based on movement
    if (moving) {
      sine.amp(0.5);
      saw.amp(0.4);
    } else {
      sine.amp(0.3);
      saw.amp(0.2);
    }
    
  } else {
    // Game over screen
    fill(255, 0, 0);
    textSize(40);
    textAlign(CENTER, CENTER);
    text("GAME OVER!", width/2, height/2 - 40);
    
    textSize(20);
    text("Final Score: " + score, width/2, height/2);
    text("Press 'r' to restart", width/2, height/2 + 40);
  }
}

void keyPressed() {
  if (key == 'r') {
    setup();
  }
}
