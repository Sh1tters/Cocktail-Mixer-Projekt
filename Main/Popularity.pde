class Popularity {
  
  void main(){
  
  }
  
  void readList(){
    String[] lines = loadStrings("Storage/list.txt");
    String[] list = {};
    for(int i = 0; i < lines.length; i++){
     list = split(lines[i], ':');
     println(list[1]);
     
     // list[0] gets index 0 and is the ID
     // list[1] gets index 1 and is the count
    }
  }
  
  
  void updatePop(){
    
  }
  
}
