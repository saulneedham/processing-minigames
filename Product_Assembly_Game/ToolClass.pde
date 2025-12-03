class Tools{
  
//Members

  boolean incremented = false;
  boolean snapped;
  boolean angleRotate = true;
  
  int angle = (int)random(0,360);
  int index, snappedIndex;
  int x = (int)random(50,width-50);
  int y = (int)random(-200,0);
  int xShift, yShift, xSize, ySize;
  int spinDirection = ((int)random(1,3))*2-3; //either -1 or 1
   
  PImage image;
  
//Constructor

  Tools(int index, String imageName, int xShift, int yShift, int xSize, int ySize) {
    this.index = index;
    this.image = loadImage(imageName+".png");
    this.image.resize(xSize*2, ySize*2); //setting standard falling size as double the snapped in toolbox size
    
    this.xShift = xShift;
    this.yShift = yShift;
    this.xSize = xSize;
    this.ySize = ySize;
  }
  
//Methods
 
  void fall() {
    if (y<350){ //stays above belt
      y+=1;
      
      if (angleRotate==true){
        angle+=spinDirection;
      }
    }
  }
  
  void render() {
    pushMatrix(); //saving current transformation matrix
    translate(x, y); //move origin to the images position
    rotate(radians(angle)); //rotate the image by random angle 
    imageMode(CENTER);
    image(image, 0, 0); //display the image at the new rotated position (0, 0)
    popMatrix();
  }
  
  void dragCheck() {
    if (mousePressed && y<470){ //checking for mouse down within top area of screen (ensures user doesnt grab tool back out of toolbox)
      if  (dist(mouseX,mouseY,x,y) <50 ){ //checking if mouse is within x and y co-ordinates of this tool object
        //setting tools x and y to the mouse if being dragged
        x=mouseX;
        y=mouseY;
        angleRotate = false; //stopping rotation once the tool is grabbed
      }
    }
  }
  
  void checkToolbox(int index) {
    if  (dist(toolboxes.get(index).x,toolboxes.get(index).y,x,y) <50 ){ //using same dist function as mouse dragging to see if tools have been placed in a toolbox
      //checking if tool is placed in toolbox
      
      y=510+yShift; //snapping the y to a constant height dependant on the tools 'yShift'
      this.image.resize(xSize, ySize); //reverting original size when tool is in box
      snapped = true;
      snappedIndex = index; //storing index of toolbox which tool is snapped to
      
      angle = 0; //resetting angle once placed in the box
      
      if (incremented == false) {
        toolsCount.set(index,toolsCount.get(index)+1); //increment number of tools in toolbox by 1
        incremented = true;
      }
    }
  }
  
  void update() {
    render();
    fall();
    dragCheck();
    
    for (int i = (toolboxes.size() - 1); i >= 0 && i >= (toolboxes.size() - 4); i--) {
      //checks up to last 4 toolboxes on screen (as max number at once is 4)
      checkToolbox(i);
    }
    
    if (snapped==true) {
      x=toolboxes.get(snappedIndex).x+xShift; //using index of toolbox the tool is snapped to, x co-ordinate is set to the same
    }
  }
  
}
