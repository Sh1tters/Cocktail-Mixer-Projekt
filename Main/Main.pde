// we dont want these integers to be changed
// so were making them private
private int state_idle = 1;
private int state_menu = 2;

// we want this to be changed if we maybe
// have to change state from different class
public int state = state_idle;

public int id = 0;

PImage idleImg;
PImage img;
loadImages loadimages = new loadImages();
float x,y;
float distance;
float mousey = 0;
boolean isSliderPressed = false;
float imageWidth = 157;
float imageHeight = 167;

float sliderboxX = 1039;
float sliderboxY = 373;
float sliderboxWidth = 471;
float sliderboxHeight = 167;

void settings() {
  // display monitor 1 on hardware setup
  fullScreen(P3D);
}

void setup() {
  // 60 frames per second (default)
  frameRate(60);
  x = 1039;
  y = 373;
  loadimages.load();
}

void draw() {
  if (state == state_idle) {
   background(idleImg);
  }

  if (state == state_menu) {
    background(255);

    rect(sliderboxX, sliderboxY, sliderboxWidth, sliderboxHeight);
     if(isSliderPressed) {
      x = mouseX - distance;
    }
    
    if(mousePressed && isMouseOverSlider()){
      tint(135);
    } else {
      tint(255); 
    }
    
    for (int i = 0; i < p.length; i++) {
      image(img, x + 167 * i, y, imageWidth, imageHeight); 
      
      //println("ID: " + i + ", image Name: " + img.getNative());
    }
    
  }
}

void mouseClicked(){
 if(state == state_idle){
   state = state_menu;
 }
}

void mouseDragged(){
  // have a rect that covers 3 pictures for the slider instead of only working on one specific image
  if (isMouseOverSlider()) { 
    x += mouseX - pmouseX; // pmouseX = previous mouse position from last frame
  }
}

boolean isMouseOverSlider() {
  return isPointInsideRectangle(mouseX, mouseY, sliderboxX, sliderboxY, sliderboxWidth, sliderboxHeight);
}

// http://www.jeffreythompson.org/collision-detection/point-rect.php
boolean isPointInsideRectangle(float px, float py, float rx, float ry, float rw, float rh) {
  return px >= rx &&        // right of the left edge AND
    px <= rx + rw &&   // left of the right edge AND
    py >= ry &&        // below the top AND
    py <= ry + rh      // above the bottom
    ;
}
