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

PImage idleImg, starIcon, menuImg, vaelgdrikImg, haeldopImg, annullerImg, lineUnderDrinks, DrinksText, IndholdText, lineUnderIndhold;
PImage[] images;
PGraphics collection;

Popularity popularity = new Popularity();
float x, y;
float xendpoint;
float xstartpoint;
float imageWidth = 166; //157
float imageHeight = 225; //167
int resizeImageWidth = 166; //166
int resizeImageHeight = 225; //167

float midRectX = 1146; //1206
float midRectY = y;
float sliderboxX = 823; //1039
float sliderboxY = 373; //373
float sliderboxWidth = 843; // 471
float sliderboxHeight = 225; // 167

void settings() {
  // display monitor 1 on hardware setup
  fullScreen(P3D);
}

void setup() {
  // 60 frames per second (default)
  frameRate(60);
  x = 1039;
  y = 373;
  IndholdText = loadImage("Indhold.png");
  lineUnderIndhold = loadImage("Line 10.png");
  lineUnderDrinks = loadImage("Line 1.png");
  DrinksText = loadImage("Drinks.png");
  vaelgdrikImg = loadImage("Group 3.png");
  haeldopImg = loadImage("Group 4.png");
  annullerImg = loadImage("Group 5.png");
  starIcon = loadImage("stjerne.png");
  starIcon.resize(40, 40);
  
  IndholdText.resize(200, 100);
  lineUnderIndhold.resize(400, 0);
  
  menuImg = loadImage("menuImg.png");
  menuImg.resize(2050, 1160);
   // load background image on idle
  idleImg = loadImage("idleImage.png"); 
  loadImages();
  popularity.loadData();
 
  collection = createGraphics(6 * resizeImageWidth, resizeImageHeight);
  for (int i = 0; i < images.length; i++) {
    collection.beginDraw();
      collection.image(images[i], 167 * i, 0);
    // get the greatest drinks ID
    if(finalGreatestID.get(0) == i){ // is drink popular?
    collection.imageMode(CORNER);
    collection.image(starIcon, 167 * i, 8);
    } else if(finalGreatestID.get(1) == i){ // is drink popular?
    collection.imageMode(CORNER);
    collection.image(starIcon, 167 * i, 8);
    } else if(finalGreatestID.get(2) == i){ // is drink popular?
    collection.imageMode(CORNER);
    collection.image(starIcon, 167 * i, 8);
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
    rect(midRectX, y, sliderboxWidth / 4, sliderboxHeight);
    
    // display slider images
   image(collection, x,y);   
   
   image(menuImg, -60, -45);
   image(DrinksText, 812, 212);
   image(lineUnderDrinks, 812, 342);
   image(IndholdText, 297, 429);
   image(lineUnderIndhold, 296, 559);
   textSize(30);
   fill(#EA1515);
   text(drinkNameMaybeSelected, 100, 100);
   fill(#FFFFFF);
   
    for (int i = 0; i < images.length; i++) {
      switcher(i);
      //println(imgholder);
      xendpoint = x + 167 * i;
      xstartpoint = x;
    }
    
    if(showHaeldopButton){
      image(haeldopImg, 1126, 653);
      image(annullerImg, 1126,756);
    } else {
      image(vaelgdrikImg, 1126, 653);
    }
   
  }
  
}

void mouseClicked() {
  if (state == state_idle) {
    state = state_menu;
  }
  
  if(state == state_menu){
    
    if(showHaeldopButton){
      
      // annuller button pressed?
      if(mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 756 && mouseY < 756 + 88){
        showHaeldopButton = false;
        drinkNameSelected = drinkNameMaybeSelected;
      }
    } else {
      // vaelg button pressed?
      if(mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 653 && mouseY < 653 + 88){
        showHaeldopButton = true;
        drinkNameSelected = drinkNameMaybeSelected;
      }
    }
    
  }
}



void mouseDragged() {
  if (isMouseOverSlider() && !showHaeldopButton) {
    if (xendpoint <= 1171) { // has slider reached endpoint right?
      x = x + 1;
    } else if (xstartpoint >= sliderboxX + 345) { // has slider reached endpoint left?
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
      if((x - 146) - (midRectX) > -190 && (x - 146) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Maybe: Pina Colada";
       //showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      }

      break;
    }
    
    // Gin og tonic
    case 1: {
      if(x + 146 * 0 - midRectX > -190 && x + 146 * 0 - midRectX < -150) {
       drinkNameMaybeSelected = "Maybe: Gin and tonic";
       //showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      }
      break;
    }
    
    // Long Island Iced Tea
    case 2: {
      if((x + 146 * 1) - (midRectX) > -190 && (x + 146 * 1) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Maybe: Long Island Iced Tea";
       //showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      }
      break;
    }
    
    // Mojito
    case 3: {
      if((x + 146 * 2) - (midRectX) > -190 && (x + 146 * 2) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Maybe: Mojito";
       //showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      }
      break;
    }
    
    // Rom og cola
    case 4: {
      if((x + 146 * 3) - (midRectX) > -190 && (x + 146 * 3) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Maybe: Rom og cola";
       //showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      }
      break;
    }
    
    // Sex on the beach
    case 5: {
      if((x + 146 * 4) - (midRectX) > -190 && (x + 146 * 4) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Maybe: Sex on the beach";
       //showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      }
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
            images[i].resize(resizeImageWidth, resizeImageHeight);
        }
        return images;
    
}
