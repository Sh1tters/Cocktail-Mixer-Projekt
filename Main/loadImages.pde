
class loadImages {

  void load(){
    
    // load [x] amount of photos for slider
    p = new Photo[9];
    for(int i = 0; i < p.length; i++){
      p[i] = new Photo(i + ".PNG");
    }
    
    // load background image on idle
    idleImg = loadImage("idleImage.png");
  }
}
