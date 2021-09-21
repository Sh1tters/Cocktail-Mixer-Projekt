Photo[] p;

class Photo {
  
  Photo(String image){
    // add each image name to the arraylist with an id also
    imgholder.add(image + ":" + id);
    img.add( loadImage(image) );
    id++;
  }
  
}
