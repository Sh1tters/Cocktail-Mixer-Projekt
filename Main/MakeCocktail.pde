String address = "http://10.113.9.124/", type = "STRING?DRINK=", typevalue = "1";

int maketime;
float filled = 0;
class MakeCocktail {

  void main(String drink) {
    init(drink);
    if (filled < 400) {
      filled = filled + 2.2;
    } else filled = 400;

    if (makeCocktail) {
       String[] lines = loadStrings(address + type + typevalue + returnDrink(drink));
      makeCocktail = false;
    }

    if (millis() > maketime + 5000)
    {
      showHaeldopButton = false;
      showVerification =false;
      state = state_idle;
      maketime = millis();
    }
  }

  void init(String drink) {
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

    showTextDrinkAfterPicked(drink);


    showIndicator(850, 750, 30);
  }
}

void showIndicator(int posx, int posy, int l) {
  noFill();
  fill(#FC0004);
  rect(posx, posy, 400, l, 400);
  fill(#14F51D);
  rect(posx, posy, filled, l, 400);
  fill(78);
  textSize(30);
  text((((filled / 400)*(100)) / 100)* 100 + "% færdig...", posx, posy-(l/2));
  fill(255);
}

String returnDrink(String drink) {
  String combo = "N/A";

  if (drink == "Pina Colada") {
    combo = "&M7=4&M6=3&M0=2";
  } else if (drink == "Gin og tonic") {
    combo = "&M6=6&KM1=3";
  } else if (drink == "Long Island Iced Tea") {
    combo = "&M3=4&M2=2&M1=2&M0=1";
  } else if (drink == "Mojito") {
    combo = "&M0=7&M4=2";
  } else if (drink == "Rom og cola") {
    combo = "&M3=6&M0=3";
  } else if (drink == "Sex on the beach") {
    combo = "&M2=5&M5=4";
  }
  return combo;
}
