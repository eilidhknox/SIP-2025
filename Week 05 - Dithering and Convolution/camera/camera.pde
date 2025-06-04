import processing.video.*;

Capture cam;

void setup() {
  size(640, 480);

  // this code sets up `cam` as a Capture device, using the first camera
  // on your computer.
  // if this doesn't work: speak to Tom
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, 640,480,cameras[0], 30);
    cam.start();     
  }      
}

void draw() {
  // every frame, if the camera is ready, we update `cam` to have
  // the latest data from it
  if (cam.available() == true) {
    cam.read();
  }
  
  // this next line is for TESTING
  // once the image appears on screen, delete it, and uncomment the code below
  image(cam,0,0);
  
  // to draw the new image pixel-by-pixel:
  // the Capture object (cam) has a property "pixels" that works just like a screen.
  //loadPixels();
  //cam.loadPixels();
  //for(int i = 0; i < cam.pixels.length; i++) {
    
  //}
  //updatePixels();
}

void keyPressed() {
  // pressing S will save the current frame to disk
  if(key == 's') {
    saveFrame("frame-######.jpg");
  }
}
