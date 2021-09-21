// we dont want these integers to be changed
// so were making them private
private int state_idle = 1;
private int state_menu = 2;

// we want this to be changed if we maybe
// have to change state from different class
public int state = state_idle;
public int id = 0;

PImage idleImg;
ArrayList<PImage> img = new ArrayList();
ArrayList<String> imgholder = new ArrayList();
loadImages loadimages = new loadImages();
float x, y;
float xendpoint;
float xstartpoint;
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
    // rectangle around the 3 images
    strokeWeight(4); // default weight
    rect(sliderboxX, sliderboxY, sliderboxWidth, sliderboxHeight);

    if (mousePressed && isMouseOverSlider()) {
      tint(135);
    } else {
      tint(255);
    }
    
    strokeWeight(8); // thicker
    rect(1206, y, sliderboxWidth / 3, sliderboxHeight);
    for (int i = 0; i < p.length; i++) {
      image(img.get(i), x + 167 * i, y, imageWidth, imageHeight);

      //println(imgholder);
      xendpoint = x + 167 * i;
      xstartpoint = x;
    }
    
    /*
    
    ellipse(x,y,10,10); // 1. image corner
    ellipse(x + 167 * 1, y, 10, 10); // 2. image corner
    ellipse(x + 167 * 2, y, 10, 10); // 3. image corner
    ellipse(x + 167 * 3, y, 10, 10); // 4. image corner
    ellipse(x + 167 * 4, y, 10, 10); // 5. image corner
    ellipse(x + 167 * 5, y, 10, 10); // 6. image corner
    
    
    Solution 1:
    Calculate each distance from every images top left corner and print which corner is closest to the rects top right corner
    
    Solution 2:
    Monitor each image, and print out if a image hits the top bar of the mid rect
    
    Solution 3: 
    
    
    
    */
    
   
  }
}

void mouseClicked() {
  if (state == state_idle) {
    state = state_menu;
  }
}



void mouseDragged() {
  if (isMouseOverSlider()) {
    if (xendpoint <= 1301) { // has slider reached endpoint left?
      x = x + 1;
    } else if (xstartpoint >= sliderboxX + 50) { // has slider reached endpoint right?
      x = x - 1;
    } else {
      x += mouseX - pmouseX; // pmouseX = previous mouse position from last frame
    }
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
