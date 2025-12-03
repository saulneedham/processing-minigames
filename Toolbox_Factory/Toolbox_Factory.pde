//https://media.istockphoto.com/id/1172279246/vector/industrial-plant-factory-silhouette-exterior-enterprise-scene-gas-helium-plants.jpg?s=612x612&w=0&k=20&c=q9OmRiP1QRqzT1RnZfPI4vYPAGZxCSIwELo2PLZjg7E=

int beltSpeed = 1;
int productDelay = 5;
int score = 0;
boolean gameRunning = true;
int productCount = 0;

int[] lineX;
int lastTime = 0;
int toolboxX = -100;
PImage backgroundImage;

ArrayList<Toolbox> toolboxs = new ArrayList<Toolbox>();
ArrayList<Tools> tools = new ArrayList<Tools>(); //polymorphism within list
int[] toolsCount = new int[0];

void setup() {
  size(800, 600);
  PFont myFont = createFont("Arial", 10);
  textFont(myFont);
  lineX = new int[40];
  for (int i = 0; i < 40; i++) { // looping through each list index
    lineX[i] = width - (i * (width / 40)); // setting 40 x co-ordinates for the conveyor belt lines
  }
}

void draw() {
  if (gameRunning==true){
    background(50,50,130); // reset the background on each frame
    fill(100,100,100);
    rect(0, height - 140, width, 100);
    fill(255, 255, 255);
    textSize(32);
    text("Score: "+score, 20, 50);
    text("Level "+beltSpeed, width-120, 50);
    
    for (int i = 0; i < 40; i++) {
      lineX[i] = (lineX[i] - beltSpeed + width) % width;  // move the line to the left and wrap around
      stroke(0);  // set line color to black
      line(lineX[i], height - 140, lineX[i], height - 40);
    }
    
    if (productCount>4){
      productCount=0;
      beltSpeed+=1;
    }
    
    int currentTime = millis(); // milliseconds since the program started
    if (currentTime - lastTime >= ((1000*productDelay)/beltSpeed)) {
      productCount+=1;
      lastTime = currentTime;
      Toolbox newToolbox = new Toolbox(toolboxs.size());
      toolboxs.add(newToolbox);
      int[] newArray = new int[toolsCount.length + 1];
      
      for (int i = 0; i <toolsCount.length; i++) {
        newArray[i] = toolsCount[i]; // Copy elements from the old array to the new one
      }
      newArray[toolsCount.length] = 0; // Append the number 0 at the end of the array
      toolsCount = newArray; // Update the reference to point to the new array
      
      tools.add(new Tools("hammer",-50,-20,80,25));
      tools.add(new Tools("pliers",40,-20,60,25));
      tools.add(new Tools("spanner",30,3,100,25));
      tools.add(new Tools("tapemeasure",-50,10,60,30));
      tools.add(new Tools("screwdriver",30,25,90,15));
      
    }

    for (int i = toolboxs.size() - 1; i >= 0; i--) {
      Toolbox b = toolboxs.get(i);
      b.update();
    }
    
    for (int i = tools.size() - 1; i >= 0; i--) {
      Tools t = tools.get(i);
      t.fall();
      t.render();
    }
  }
}
