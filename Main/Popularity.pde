import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Collectors;

IntDict greatestCollection = new IntDict();
IntDict idCollection = new IntDict();
JSONObject json;
ArrayList<Integer> counter = new ArrayList();
ArrayList<String> greatest = new ArrayList();
ArrayList<Integer> finalGreatestID = new ArrayList();
int id;

class Popularity {
 
  void loadData(){
        json = loadJSONObject("Storage/data.json");
        
        
        
        JSONArray values = json.getJSONArray("drinks");
        for(int i = 0; i < values.size(); i++){
       
           JSONObject drinks = values.getJSONObject(i);
           
           id = drinks.getInt("id");
           int count = drinks.getInt("count");
           
           idCollection.set(""+count, i);
           counter.add(count);
           
        }
        getHighest();

        for(int i = 0; i < 3; i++){
         finalGreatestID.add(idCollection.get(""+greatest.get(i)));
        }
        
     
        
    }
    
    
    
    /*
    Vi laver en funktion for at få den højeste værdi ud af et array list
    Vi kalder funktionen for getHighest, og dermed bruger vores java utilites som er implementeret
    Vores arraylist hedder counter, og vi bruger dermed Collections.sort(counter) til at sortere det fra mindst --> størst, og derefter
    bruger vi Collections.reverse(counter) så vi har størst --> mindst
    Til sidst bruger vi en for loop og tager de 3 første værdier i vores arrayList, nemlig de 3 største værdier
    og dermed adder den værdi i vores greatest arraylisst
    
    */
    
    String getHighest(){
      // sorting list from greatest to least
      Collections.sort(counter);
      Collections.reverse(counter);
      // getting the top 3 greatest
      for(int i = 0; i < 3; i++){
        greatest.add(""+counter.get(i)); 
      }
      
      return "";
    }
    
    void AddOnCount(String drinkNameSelected){
      
    }
  
}
