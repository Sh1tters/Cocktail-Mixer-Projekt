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
  
}
