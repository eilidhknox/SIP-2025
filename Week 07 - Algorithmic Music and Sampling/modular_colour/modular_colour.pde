color[] colours = {
  color(0, 0, 0), // black
  color(255, 255, 255), // white
  color(255, 0, 0), // red
  color(0, 0, 255) // blue
};
int coloursCount = colours.length;

color fillColour;
float bpm = 120;
float myFrameRate = bpm / 60;

void setup() {
  size(400, 400);
  frameRate(myFrameRate);
  println(coloursCount);
  
}

void draw(){
 
  background(220);
  
  fillColour = colours[frameCount % coloursCount];
  fill(fillColour);
  
  circle(20, 100, 30);
  
}
  
  
