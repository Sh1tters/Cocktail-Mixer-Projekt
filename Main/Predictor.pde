class Predictor {

  void sendMessage() {
    client.write("drink");
  }


  void getPredictedDrink() {
    sendMessage();
    delay(1000);
    String whatClientSaid = client.readString();
    println(whatClientSaid + "\n");
    
    
    
  }
}
