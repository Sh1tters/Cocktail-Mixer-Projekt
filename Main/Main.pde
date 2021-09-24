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
<<<<<<< Updated upstream

PImage idleImg;
=======
public boolean showVerification = false;
PImage idleImg, starIcon, menuImg, vaelgdrikImg, haeldopImg, annullerImg, lineUnderDrinks, DrinksText, IndholdText, lineUnderIndhold, PinaColadaImg, GinOgTonicImg, LongIslandImg, MojitoImg, RomOgColaImg, SexOnTheBeachImg, VeriYesText, VeriNoText, VeriBackground, VeriYesRect, VeriNoRect, VeriAreUSure;
>>>>>>> Stashed changes
PImage[] images;
PGraphics collection;

Popularity popularity = new Popularity();
MakeCocktail makecocktail = new MakeCocktail();
float x, y;
float xendpoint;
float xstartpoint;
float imageWidth = 157;
float imageHeight = 167;

float sliderboxX = 1039;
float sliderboxY = 373;
float sliderboxWidth = 471;
float sliderboxHeight = 167;

String drink_text = "";

String drink_text = "";

void settings() {
  // display monitor 1 on hardware setup
  fullScreen(P3D);
}

void setup() {
  // 60 frames per second (default)
  frameRate(60);
  x = 1039;
  y = 373;
<<<<<<< Updated upstream
<<<<<<< Updated upstream

=======
  IndholdText = loadImage("Indhold.png");
  lineUnderIndhold = loadImage("Line 10.png");
  lineUnderDrinks = loadImage("Line 1.png");
  lineUnderDrinks.resize(850, 0);
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
>>>>>>> Stashed changes
   // load background image on idle
  idleImg = loadImage("idleImage.png"); 
  loadImages();
=======
  loadPImages();
  loadImagesForSlider();
>>>>>>> Stashed changes
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
   
<<<<<<< Updated upstream
=======
   image(menuImg, -60, -45);
   image(DrinksText, 812, 212);
   image(lineUnderDrinks, 812, 342);
   image(IndholdText, 297, 429);
   image(lineUnderIndhold, 296, 529);
<<<<<<< Updated upstream
   textSize(30);
   fill(#EA1515);
   text(drinkNameMaybeSelected, 100, 100);
   fill(#FFFFFF);
   
>>>>>>> Stashed changes
=======

>>>>>>> Stashed changes
    for (int i = 0; i < images.length; i++) {
      switcher(i);
      //println(imgholder);
      xendpoint = x + 167 * i;
      xstartpoint = x;
    }
<<<<<<< Updated upstream
=======
    
    if(showHaeldopButton){
        if(showVerification){
          //VeriYesText, VeriNoText, VeriBaBackground, VeriYesRect, VeriNoRect, VeriAreUSure
          image(VeriBackground, 0, 0);
          image(VeriYesRect, 0, 0);
          image(VeriYesText, 0, 0);
          image(VeriNoRect, 0, 0);
          image(VeriNoText, 0, 0);
          image(VeriAreUSure, 0, 0);
          
          popularity.addCount(drinkNameSelected);
        makecocktail.main();
        } else {
         showTextDrinkAfterPicked(drinkNameSelected);
      image(haeldopImg, 1126, 653);
      image(annullerImg, 1126,756); 
        }
    } else {
      showTextDrinkBeforePicked(drinkNameMaybeSelected);
      image(vaelgdrikImg, 1126, 653);
    }
>>>>>>> Stashed changes
   
  }
}

void mouseClicked() {
  if (state == state_idle) {
    state = state_menu;
  }
<<<<<<< Updated upstream
=======
  
  if(state == state_menu){
    
    if(showHaeldopButton){ // user has picked a drink
<<<<<<< Updated upstream
      
=======
      if(showVerification){
          
      } else {
      // haeldop button pressed?
      if(mouseX > 1126 && mouseX < 1126 + 256 && mouseY > 653 && mouseY < 653 + 88){
        
        // show verification buttons  
        showVerification = true;
      }
      
      }
>>>>>>> Stashed changes
      
      // annuller button pressed?
      if(mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 756 && mouseY < 756 + 88){
        showHaeldopButton = false;
        drinkNameSelected = drinkNameMaybeSelected;
      } 
    } else { // user has not picked a drink
      // vaelg button pressed?
      if(mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 653 && mouseY < 653 + 88){
        showHaeldopButton = true;
        drinkNameSelected = drinkNameMaybeSelected;
      }
    }
    
  }
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      if((x - 167) - (1206) > -190 && (x - 167) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Pina Colada";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
=======
      if((x - 146) - (midRectX) > -190 && (x - 146) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Pina Colada";
      }
>>>>>>> Stashed changes

      break;
    }
    
    // Gin og tonic
    case 1: {
<<<<<<< Updated upstream
      if(x + 167 * 0 - 1206 > -190 && x + 167 * 0 - 1206 < -150) {
       drinkNameMaybeSelected = "Maybe: Gin and tonic";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
=======
      if(x + 146 * 0 - midRectX > -190 && x + 146 * 0 - midRectX < -150) {
       drinkNameMaybeSelected = "Gin and tonic";
      }
>>>>>>> Stashed changes
      break;
    }
    
    // Long Island Iced Tea
    case 2: {
<<<<<<< Updated upstream
      if((x + 167 * 1) - (1206) > -190 && (x + 167 * 1) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Long Island Iced Tea";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
=======
      if((x + 146 * 1) - (midRectX) > -190 && (x + 146 * 1) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Long Island Iced Tea";
      }
>>>>>>> Stashed changes
      break;
    }
    
    // Mojito
    case 3: {
<<<<<<< Updated upstream
      if((x + 167 * 2) - (1206) > -190 && (x + 167 * 2) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Mojito";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
=======
      if((x + 146 * 2) - (midRectX) > -190 && (x + 146 * 2) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Mojito";
      }
>>>>>>> Stashed changes
      break;
    }
    
    // Rom og cola
    case 4: {
<<<<<<< Updated upstream
      if((x + 167 * 3) - (1206) > -190 && (x + 167 * 3) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Rom og cola";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
=======
      if((x + 146 * 3) - (midRectX) > -190 && (x + 146 * 3) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Rom og cola";
      }
>>>>>>> Stashed changes
      break;
    }
    
    // Sex on the beach
    case 5: {
<<<<<<< Updated upstream
      if((x + 167 * 4) - (1206) > -190 && (x + 167 * 4) - (1206) < -150) {
       drinkNameMaybeSelected = "Maybe: Sex on the beach";
       showHaeldopButton = true;
       println(drinkNameMaybeSelected);
      } else showHaeldopButton = false;
=======
      if((x + 146 * 4) - (midRectX) > -190 && (x + 146 * 4) - (midRectX) < -150) {
       drinkNameMaybeSelected = "Sex on the beach";
      }
>>>>>>> Stashed changes
      break;
    }
    
    
    

    
  }
}

void showTextDrinkAfterPicked(String drinkNameSelected){
  switch(drinkNameSelected) {
    case "Pina Colada": {
      image(PinaColadaImg, 1135, 593);
      break;
    }
    
    case "Gin and tonic": {
      image(GinOgTonicImg, 1135, 593);
      break;
    }
    
    case "Long Island Iced Tea": {
      image(LongIslandImg, 1075, 593);
      break;
    }
    
    case "Mojito": {
      image(MojitoImg, 1195, 593);
      break;
    }
    
    case "Rom og cola": {
      image(RomOgColaImg, 1135, 593);
      break;
    }
    
    case "Sex on the beach": {
      image(SexOnTheBeachImg, 1095, 593);
      break;
    }
  }
}

void showTextDrinkBeforePicked(String drinkNameMaybeSelected){
  switch(drinkNameMaybeSelected) {
    case "Pina Colada": {
      image(PinaColadaImg, 1135, 593);
      break;
    }
    
    case "Gin and tonic": {
      image(GinOgTonicImg, 1135, 593);
      break;
    }
    
    case "Long Island Iced Tea": {
      image(LongIslandImg, 1075, 593);
      break;
    }
    
    case "Mojito": {
      image(MojitoImg, 1195, 593);
      break;
    }
    
    case "Rom og cola": {
      image(RomOgColaImg, 1135, 593);
      break;
    }
    
    case "Sex on the beach": {
      image(SexOnTheBeachImg, 1095, 593);
      break;
    }
  }
}

void loadPImages(){
  VeriAreUSure = loadImage("Er du sikker.png");
  VeriYesText = loadImage("Ja.png");
  VeriYesRect = loadImage("Rectangle 9.png");
  VeriNoText = loadImage("Nej.png");
  VeriNoRect = loadImage("Rectangle 10.png");
  VeriBackground = loadImage("Rectangle 8.png");
  SexOnTheBeachImg = loadImage("Sex on the beach.png");
  RomOgColaImg = loadImage("Rom og cola.png");
  MojitoImg = loadImage("Mojito.png");
  LongIslandImg = loadImage("Long Island Iced Tea.png");
  GinOgTonicImg = loadImage("Gin og tonic.png");
  PinaColadaImg = loadImage("Pina Colada.png");
  IndholdText = loadImage("Indhold.png");
  lineUnderIndhold = loadImage("Line 10.png");
  lineUnderDrinks = loadImage("Line 1.png");
  lineUnderDrinks.resize(850, 0);
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

  idleImg = loadImage("idleImage.png"); 
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

PImage[] loadImagesForSlider() {
 // load [x] amount of photos for slider
        images = new PImage[6];
        for(int i = 0; i < images.length; i++){
            images[i] = loadImage(i + ".PNG");
            images[i].resize(167, 157);
        }
        return images;
    
}
