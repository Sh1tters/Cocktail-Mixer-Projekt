class Predictor {

  void sendMessage() {
    client.write("drink");
  }


  void getPredictedDrink() {
    sendMessage();
    delay(1000);
    byte[] whatClientSaid = client.readBytes();
    if(whatClientSaid != null){
       String recommendDrink = new String(whatClientSaid); 
       println("Recommended Drink: "+recommendDrink);
       predicted_drink = Integer.parseInt(recommendDrink);
    }
  }
}
