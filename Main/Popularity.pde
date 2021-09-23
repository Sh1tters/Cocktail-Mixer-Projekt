import java.util.ArrayList;
import java.util.Collections;
import java.util.stream.Collectors;

JSONObject json;
ArrayList<Integer> counter = new ArrayList<>();
ArrayList<String> greatest = new ArrayList<>();

class Popularity {
 
  void loadData(){
        json = loadJSONObject("Storage/data.json");
        
        
        JSONArray values = json.getJSONArray("drinks");
        for(int i = 0; i < values.size(); i++){
           
           JSONObject drinks = values.getJSONObject(i);
           
           int id = drinks.getInt("id");
           int count = drinks.getInt("count");
           String name = drinks.getString("name");
           
           counter.add(count);
           
           //println(id + ", " + count + ", " + name);
        }
        getHighest();
        println(greatest);
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
