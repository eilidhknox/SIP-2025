// Space Escape Game — FINAL VERSION
// by [Your Name / Pair]

import processing.sound.*;

SinOsc sine;
SawOsc saw;

PVector gravity = new PVector(0, 0.1);
PVector wind = new PVector(0.03, 0);

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
    player.applyForce(gravity);
    player.applyForce(wind);
    
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
    
    player.update();
    player.display();
    
    for (Enemy e : enemies) {
      e.update(player);
      e.display();
      
      if (e.checkCollision(player)) {
        gameOver = true;
        
        sine.freq(100);
        saw.freq(50);
        sine.amp(0.5);
        saw.amp(0.5);
      }
    }
    
    timer++;
    if (timer % 60 == 0) {
      score++;
    }
    
    fill(255);
    textSize(20);
    text("Score: " + score, 10, 30);
    
    float mod = sin(frameCount * 0.01);
    sine.freq(200 + mod * 50);
    saw.freq(100 + mod * 30);
    
    if (moving) {
      sine.amp(0.5);
      saw.amp(0.4);
    } else {
      sine.amp(0.3);
      saw.amp(0.2);
    }
    
  } else {
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
