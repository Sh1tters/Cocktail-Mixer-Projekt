// we dont want these integers to be changed
// so were making them private
private int state_idle = 1;
private int state_menu = 2;

// we want this to be changed if we maybe
// have to change state from different class
public int state = state_idle;

public String drinkNameMaybeSelected = "N/A";
public String drinkNameSelected = "N/A";
public boolean showHaeldopButton = false;

PImage idleImg;
PImage[] images;
PGraphics collection;

Popularity popularity = new Popularity();
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

   // load background image on idle
  idleImg = loadImage("idleImage.png"); 
  loadImages();
  popularity.loadData();
 
  collection = createGraphics(6 * 167, 157);
  for (int i = 0; i < images.length; i++) {
    collection.beginDraw();
      collection.image(images[i], 167 * i, 0);
    // get the greatest drinks ID
    if(finalGreatestID.get(0) == i){ // is drink popular?
     println("1st"); 
     collection.textAlign(CENTER);
     collection.textSize(23);
     collection.fill(#7B7C68);
     collection.text("Populær", 187 * i, 20);
    } else if(finalGreatestID.get(1) == i){ // is drink popular?
     println("2nd"); 
     collection.textAlign(CENTER);
     collection.textSize(23);
     collection.fill(#7B7C68);
     collection.text("Populær", 187 * i, 20);
    } else if(finalGreatestID.get(2) == i){ // is drink popular?
     println("3rd");
     collection.textAlign(CENTER);
     collection.textSize(23);
     collection.fill(#7B7C68);
     collection.text("Populær", 187 * i, 20);
    } else {
      collection.endDraw();
      
    } 
    

   }
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

    /*
    if (mousePressed && isMouseOverSlider()) {
      tint(135);
    } else {
      tint(255);
    }
    */
    
    strokeWeight(8); // thicker
    rect(1206, y, sliderboxWidth / 3, sliderboxHeight);
    
    // display slider images
   image(collection, x,y);   
   
    for (int i = 0; i < images.length; i++) {
      switcher(i);
      //println(imgholder);
      xendpoint = x + 167 * i;
      xstartpoint = x;
    }
   
  }
}

void mouseClicked() {
  if (state == state_idle) {
    state = state_menu;
  }
}



void mouseDragged() {
  if (isMouseOverSlider()) {
    if (xendpoint <= 1181) { // has slider reached endpoint right?
      x = x + 1;
    } else if (xstartpoint >= sliderboxX + 200) { // has slider reached endpoint left?
      x = x - 1;
    } else {
      x += mouseX - pmouseX; // pmouseX = previous mouse position from last frame
    }
  }
}





private void switcher(int i){
  switch(i){
    
    // Pina Colada
    case 0: {
      if((x - 167) - (1206) > -190 && (x - 167) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Pina Colada";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;

      break;
    }
    
    // Gin og tonic
    case 1: {
      if(x + 167 * 0 - 1206 > -190 && x + 167 * 0 - 1206 < -150) {
       drinkNameMaybeSelected = "Maybe: Gin and tonic";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
      break;
    }
    
    // Long Island Iced Tea
    case 2: {
      if((x + 167 * 1) - (1206) > -190 && (x + 167 * 1) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Long Island Iced Tea";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
      break;
    }
    
    // Mojito
    case 3: {
      if((x + 167 * 2) - (1206) > -190 && (x + 167 * 2) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Mojito";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
      break;
    }
    
    // Rom og cola
    case 4: {
      if((x + 167 * 3) - (1206) > -190 && (x + 167 * 3) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Rom og cola";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
      break;
    }
    
    // Sex on the beach
    case 5: {
      if((x + 167 * 4) - (1206) > -190 && (x + 167 * 4) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Sex on the beach";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
      break;
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

PImage[] loadImages() {
 // load [x] amount of photos for slider
        images = new PImage[6];
        for(int i = 0; i < images.length; i++){
            images[i] = loadImage(i + ".PNG");
            images[i].resize(167, 157);
        }
        return images;
    
}
