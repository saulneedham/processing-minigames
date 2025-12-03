boolean gameRunning = true;

int productCount = 0;
int productDelay = 4;
int score = 0;
int beltSpeed = 1;
int lastTime = 0;

int[] lineX = new int[40]; //fixed array for belt lines

ArrayList<Toolbox> toolboxes = new ArrayList<Toolbox>();
ArrayList<Tools> tools = new ArrayList<Tools>();
ArrayList<Integer> toolsCount = new ArrayList<Integer>(); //arrayList for counting how many tools have been placed into each box

void setup() {
  size(800, 600);
  
  PFont myFont = createFont("Arial", 10); //preloading font so game doesn't initially lag
  textFont(myFont);
  
  for (int i = 0; i < 40; i++) { // looping through each list index
    lineX[i] = width - (i * (width / 40)); // setting 40 x co-ordinates for the conveyor belt lines
  }
}

void draw() {
  if (gameRunning == true){
    background(50, 50, 130);
    fill(100, 100, 100);
    rect(0, height - 140, width, 100); //belt
    
    fill(255, 255, 255);
    textSize(32);
    text("Score: "+score, 20, 50); //score tally in top left
    text("Level "+beltSpeed, width-120, 50); //level count in top right
    
    stroke(0);  // set line color to black
    for (int i = 0; i < 40; i++) {
      lineX[i] = (lineX[i] - beltSpeed + width) % width;  // move the line to the left and wrap around
      line(lineX[i], height - 140, lineX[i], height - 40);
    }
    
    if (productCount>4){ //every 4 toolboxes 
      productCount=0;
      beltSpeed+=1; //increase belt speed
    }
    
    int currentTime = millis(); // milliseconds since the program started
    if (currentTime - lastTime >= ((1000*productDelay)/beltSpeed)) { //productDelay/beltSpeed to that time between boxes decreases as the levels get harder
      lastTime = currentTime;
      int index = toolboxes.size(); //number of times loop has repeated
      
      productCount+=1;
      toolsCount.add(0); //adding new index of 0 to count how many tools will be added to respective toolbox
      toolboxes.add(new Toolbox(index)); //adding new toolbox object to arrayList
      
      tools.add(new Hammer(index));
      tools.add(new Pliers(index));
      tools.add(new Spanner(index));
      tools.add(new Screwdriver(index));
      tools.add(new Tapemeasure(index));  //adding each new tool object to arrayList
      }
      
    for (int i = toolboxes.size() - 1; i >= 0; i--) {
      Toolbox b = toolboxes.get(i);
      b.update();
    }
      
    for (int i = tools.size() - 1; i >= 0; i--) {
      Tools t = tools.get(i);
      t.update();
    }
  }
}
