//var
int beltSpeed = 2;
int productDelay = 4;
int numToppings = 0;
int score = 0;
boolean gameRunning = true;
int productCount = 0;
//cons
int[] lineX;
int lastTime = 0;
int pizzaX = -100;
//arrays
ArrayList<Pizza> pizzas = new ArrayList<Pizza>();
ArrayList<Toppings> toppings = new ArrayList<Toppings>();
String[] toppingsNames = {"mushrooms", "onions", "pepperoni", "olives", "peppers"};
int[] toppingsCount = new int[0];

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
    background(200, 200, 200); // clear the background on each frame
    fill(100, 100, 100);
    rect(0, height - 140, width, 100);
    textSize(32);
    text("Score: "+score, 20, 50);
    
    for (int i = 0; i < 40; i++) {
      lineX[i] = (lineX[i] - beltSpeed + width) % width;  // move the line to the left and wrap around
      stroke(0);  // set line color to black
      line(lineX[i], height - 140, lineX[i], height - 40);
    }
    
    if (productCount>4){
      productCount=0;
      beltSpeed+=1;
      productDelay*=0.8;
    }
    
    int currentTime = millis(); // milliseconds since the program started
    if (currentTime - lastTime >= productDelay*1000) {
      productCount+=1;
      lastTime = currentTime;
      Pizza newPizza = new Pizza(pizzas.size());
      pizzas.add(newPizza);
      int[] newArray = new int[toppingsCount.length + 1];
      
      for (int i = 0; i <toppingsCount.length; i++) {
        newArray[i] = toppingsCount[i]; // Copy elements from the old array to the new one
      }
      newArray[toppingsCount.length] = 0; // Append the number 0 at the end of the array
      toppingsCount = newArray; // Update the reference to point to the new array
      
      for (String toppingsName : toppingsNames) {
        if (numToppings<10){
          toppings.add(new Toppings(toppingsName));
          numToppings+=1;
        }
      }
    }

    for (int i = pizzas.size() - 1; i >= 0; i--) { //pizza list size
      Pizza p = pizzas.get(i);
      p.update();
      //println(pizzas.size());
    }
    
      for (int i = toppings.size() - 1; i >= 0; i--) { //pizza list size
      Toppings t = toppings.get(i);
      t.render();
      //println(pizzas.size());
    }
  }
}
