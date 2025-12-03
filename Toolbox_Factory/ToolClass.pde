//https://www.vectorstock.com/royalty-free-vector/tools-clipart-vector-2498161
//https://creazilla.com/nodes/38514-tape-measure-clipart

class Tools{
  String i;
  boolean snapped = false;
  int x = (int)random(50,width-50);
  int y = (int)random(-200,0);
  int xChange;
  int yChange;
  int xSize;
  int ySize;
  int toolboxIndex;
  PImage image;
  boolean incremented = false;
  
  Tools(String imageName, int xChange, int yChange, int xSize, int ySize) {
    this.image = loadImage(imageName+".png");
    this.image.resize(xSize*2, ySize*2);
    //
    this.xChange = xChange;
    this.yChange = yChange;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
  void checkToolbox(int index) {
    if (abs(toolboxs.get(index).x-x)<50){
      if (y<=560 && y>=460){ //belt co-ordinates
        y=510+yChange; //510  
        this.image.resize(xSize, ySize);
        snapped = true;
        toolboxIndex = index;
        if (incremented == false){
          toolsCount[index] += 1; // Add 1 to the element at the specified index
          incremented = true;
        }
      }
    }
  }
  
  void fall(){
    if (y<350){ //doesn't hit belt
      y+=1;
    }
  }
  
  void render() {
    imageMode(CENTER);
    image(image, x, y);
    
    int numberOfToolboxes = toolboxs.size();
    for (int i = numberOfToolboxes - 1; i >= 0 && i >= numberOfToolboxes - 4; i--) {
      checkToolbox(i);
    }

    
    if (mousePressed && y<460){
      if  (dist(mouseX,mouseY,x,y) <50 ){
        x=mouseX;
        y=mouseY;
      }
    }
    
    if (snapped==true){
      x=toolboxs.get(toolboxIndex).x+xChange;
    }
  }
}
