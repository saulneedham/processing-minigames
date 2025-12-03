class Toppings {
  String i;
  int snapped = -1;
  int x = (int)random(600.0)+100; //100-700
  int y = (int)random(200.0)+100; //100-300 //510 when snapped
  PImage image;
  boolean incremented = false;
  
  Toppings(String imageName) {
    this.i = imageName;
    this.image = loadImage(imageName+".png");
    this.image.resize(100, 100);
  }
  
  void checkPizza(int index) {
    if (abs(pizzas.get(index).x-x)<50){
      //println(pizzas.get(pizzas.size()-1).x);
      if (y<=560 && y>=460){ //belt co-ordinates
        y=510;
        this.image = loadImage(i+"2.png");
        snapped = index;
        if (incremented == false){
          toppingsCount[index] += 1; // Add 1 to the element at the specified index
          incremented = true;
          numToppings-=1;
        }
      }
    }
  }
  
  void render() {
    imageMode(CENTER);
    image(image, x, y);
    
    if (pizzas.size()>1){
      checkPizza(pizzas.size()-1);
      checkPizza(pizzas.size()-2);
    }
    else{
      checkPizza(pizzas.size()-1);
    }
    
    if (mousePressed && y<460){
      if  (dist(mouseX,mouseY,x,y) <50 ){
        x=mouseX;
        y=mouseY;
      }
    }
    
    if (snapped != -1){
      x=pizzas.get(snapped).x;
    }
  }
}
