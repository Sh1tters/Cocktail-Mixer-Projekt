// SOCKETS
import processing.net.*;

Client client;



private int state_idle = 1;
private int state_menu = 2;
private int state_drink = 3;

public int state = state_idle;

public String drinkNameMaybeSelected = "Gin og tonic";
public String drinkNameSelected = "N/A";
public boolean showHaeldopButton = false;

public int predicted_drink;

public boolean showVerification = false;
PImage idleImg, starIcon, recommendIcon, menuImg, vaelgdrikImg, haeldopImg, annullerImg, lineUnderDrinks, DrinksText, IndholdText, lineUnderIndhold, PinaColadaImg, GinOgTonicImg,
  LongIslandImg, MojitoImg, RomOgColaImg, SexOnTheBeachImg, VeriYesText, VeriNoText, VeriBackground, VeriYesRect, VeriNoRect, VeriAreUSure, RomOgColaIndhold;

PImage[] images;
PGraphics collection;

Popularity popularity = new Popularity();
MakeCocktail makecocktail = new MakeCocktail();
Predictor predict = new Predictor();
float x, y;
float xendpoint;
float xstartpoint;
float imageWidth = 166;
float imageHeight = 225;
int resizeImageWidth = 166;
int resizeImageHeight = 225;

float midRectX = 1146;
float midRectY = y;
float sliderboxX = 823;
float sliderboxY = 373;
float sliderboxWidth = 843;
float sliderboxHeight = 225;

boolean makeCocktail = false;

void settings() {
  // display monitor 1 on hardware setup
  fullScreen(P3D);
}

void setup() {
  client = new Client(this, "127.0.0.1", 9050); // Connects to python server
predict.getPredictedDrink();
  // 60 frames per second (default)
  frameRate(60);
  x = 1039;
  y = 373;
  loadPImages();
  loadImagesForSlider();
  popularity.loadData();
  
  collection = createGraphics(6 * resizeImageWidth, resizeImageHeight);
  for (int i = 0; i < images.length; i++) {
    println(predicted_drink, i);
    collection.beginDraw();
    collection.image(images[i], 167 * i, 0);
    // get the greatest drinks ID
    if (finalGreatestID.get(0) == i && predicted_drink != i) { // is drink popular?
      collection.imageMode(CORNER); // corner image
      collection.image(starIcon, 167 * i, 8); // add image on image
    } else if (finalGreatestID.get(1) == i && predicted_drink != i) { // is drink popular?
      collection.imageMode(CORNER); // corner image
      collection.image(starIcon, 167 * i, 8); // add image on image
    } else if (finalGreatestID.get(2) == i && predicted_drink != i) { // is drink popular?
      collection.imageMode(CORNER); // corner image
      collection.image(starIcon, 167 * i, 8); // add image on image
    } if(predicted_drink == i){
       collection.imageMode(CORNER); // corner image
      collection.image(recommendIcon, 167 * i, 8); // add image on image
    } else {
      collection.endDraw(); // finish draw
    }
  }
}

void draw() {
  if (state == state_idle) {
    background(idleImg);
  }

  if (state == state_drink) {
    makecocktail.main(drinkNameSelected);
  }

  if (state == state_menu) {
    background(255);
    // rectangle around the 3 images
    strokeWeight(4); // default weight
    rect(sliderboxX, sliderboxY, sliderboxWidth, sliderboxHeight); // rect around slider items

    strokeWeight(8); // thicker
    rect(midRectX, y, sliderboxWidth / 4, sliderboxHeight); // mid part of rect

    // display slider images
    image(collection, x, y);
    image(menuImg, -60, -45);
    image(DrinksText, 812, 212);
    image(lineUnderDrinks, 812, 342);
    image(IndholdText, 297, 429);
    image(lineUnderIndhold, 296, 559);


    for (int i = 0; i < images.length; i++) {
      switcher(i);

      xendpoint = x + 167 * i;
      xstartpoint = x;
    }

    if (showHaeldopButton && !makeCocktail) {
      showTextDrinkAfterPicked(drinkNameSelected);
      image(haeldopImg, 1126, 653);
      image(annullerImg, 1126, 756);
    } else  if (!makeCocktail) {
      showTextDrinkBeforePicked(drinkNameMaybeSelected);
      image(vaelgdrikImg, 1126, 653);
    }
  }
}

void mouseClicked() {
  if (state == state_idle) {
    state = state_menu;
  //  predict.getPredictedDrink();
  }

  if (state == state_menu) {

    if (showHaeldopButton) {
      if (mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 653 && mouseY < 653 + 88) { // haeld op button pressed?
        state = state_drink;
        maketime  = millis();
        popularity.AddOnCount(drinkNameSelected);
        makeCocktail = true;
        filled = 0;
      }

      // annuller button pressed?
      if (mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 756 && mouseY < 756 + 88) {
        showHaeldopButton = false;
        drinkNameSelected = drinkNameMaybeSelected;
      }
    }
    // vaelg button pressed?
    if (mouseX > 1126 && mouseX < 1126 + 265 && mouseY > 653 && mouseY < 653 + 88) {
      showHaeldopButton = true;
      drinkNameSelected = drinkNameMaybeSelected;
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





private void switcher(int i) {
  switch(i) {

    // Pina Colada
  case 0:
    {
      if ((x - 146) - (midRectX) > -190 && (x - 146) - (midRectX) < -150) {
        drinkNameMaybeSelected = "Pina Colada";
      }

      break;
    }

    // Gin og tonic
  case 1:
    {
      if (x + 146 * 0 - midRectX > -190 && x + 146 * 0 - midRectX < -150) {
        drinkNameMaybeSelected = "Gin og tonic";
      }
      break;
    }

    // Long Island Iced Tea
  case 2:
    {
      if ((x + 146 * 1) - (midRectX) > -190 && (x + 146 * 1) - (midRectX) < -150) {
        drinkNameMaybeSelected = "Long Island Iced Tea";
      }
      break;
    }

    // Mojito
  case 3:
    {
      if ((x + 146 * 2) - (midRectX) > -190 && (x + 146 * 2) - (midRectX) < -150) {
        drinkNameMaybeSelected = "Mojito";
      }
      break;
    }

    // Rom og cola
  case 4:
    {
      if ((x + 146 * 3) - (midRectX) > -190 && (x + 146 * 3) - (midRectX) < -150) {
        drinkNameMaybeSelected = "Rom og cola";
      }
      break;
    }

    // Sex on the beach
  case 5:
    {
      if ((x + 146 * 4) - (midRectX) > -190 && (x + 146 * 4) - (midRectX) < -150) {
        drinkNameMaybeSelected = "Sex on the beach";
      }
      break;
    }
  }
}


void showTextDrinkAfterPicked(String drinkNameSelected) {
  switch(drinkNameSelected) {
  case "Pina Colada":
    {
      image(PinaColadaImg, 1135, 593);
      break;
    }

  case "Gin og tonic":
    {
      image(GinOgTonicImg, 1135, 593);
      break;
    }

  case "Long Island Iced Tea":
    {
      image(LongIslandImg, 1075, 593);
      break;
    }

  case "Mojito":
    {
      image(MojitoImg, 1195, 593);
      break;
    }

  case "Rom og cola":
    {
      image(RomOgColaImg, 1135, 593);
      image(RomOgColaIndhold, 296, 584);
      break;
    }

  case "Sex on the beach":
    {
      image(SexOnTheBeachImg, 1095, 593);
      break;
    }
  }
}

void showTextDrinkBeforePicked(String drinkNameMaybeSelected) {
  switch(drinkNameMaybeSelected) {
  case "Pina Colada":
    {
      image(PinaColadaImg, 1135, 593);
      break;
    }

  case "Gin og tonic":
    {
      image(GinOgTonicImg, 1135, 593);
      break;
    }

  case "Long Island Iced Tea":
    {
      image(LongIslandImg, 1075, 593);
      break;
    }

  case "Mojito":
    {
      image(MojitoImg, 1195, 593);
      break;
    }

  case "Rom og cola":
    {
      image(RomOgColaImg, 1135, 593);
      image(RomOgColaIndhold, 296, 584);
      break;
    }

  case "Sex on the beach":
    {
      image(SexOnTheBeachImg, 1095, 593);
      break;
    }
  }
}

void loadPImages() {
  RomOgColaIndhold = loadImage("RomOgColaIndhold.png");
  RomOgColaIndhold.resize(400, 137);
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
  recommendIcon = loadImage("recommend.png");
  recommendIcon.resize(40, 40);
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

/*
Opretter en PImage Array med navnet loadImagesForSlider
 I vores array, har vi en allerede oprettet PImages som hedder images og dermed giver den 6 array elements i vores PImage array
 Vi laver nu en for loop og kører igennem vores images.length som er 5
 For hver array element, giver en images en ny slot med en loaded image
 Vi resizer nu images til den bestemte width og height
 og til sidst returner vi images, så vi kan bruge det et andet sted.
 */

PImage[] loadImagesForSlider() {
  // load [x] amount of photos for slider
  images = new PImage[6];
  for (int i = 0; i < images.length; i++) {
    images[i] = loadImage(i + ".PNG");
    images[i].resize(resizeImageWidth, resizeImageHeight);
  }
  return images;
}
