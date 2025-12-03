class Pizza {
  int index;
  boolean scoreChecked = false;
  int x = width+100;
  int y = height-90;
  int size = 100;
  
  Pizza(int index){
    this.index = index;
  }
  
  void render() {
    fill(156,121,63);
    ellipse(x,y,size,size); //crust
    fill(250,199,61);
    ellipse(x,y,size-12,size-12); //base
  }
  
  void move() {
    x-=beltSpeed;
    if (x<-50 && scoreChecked == false){
      if (toppingsCount[this.index]>=3){
        score+=1;
      }
      else{
        //end game#
        fill(0,0,0);
        textSize(100);
        text("You lose!",width/4,height/2-25);
        for (int i = toppings.size() - 1; i >= 0; i--) {
          if (toppings.get(i).y<470)//only toppings not on pizzas
            toppings.remove(i);//deleting all toppings on screen
        }
        gameRunning=false;
      }
      scoreChecked=true;
    }
  }
  
  void update() {
    move();
    render();
  }
}
