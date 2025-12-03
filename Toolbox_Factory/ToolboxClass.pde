class Toolbox{
  int index;
  boolean scoreChecked = false;
  int x = width+150;
  int y = height-90;
  int Xsize = 200;
  int Ysize = 80;
  int innerSize = 3;
  
  Toolbox(int index){
    this.index = index;
  }
  
  void render() {
    fill(255,10,10); //outer box
    rect(x-(Xsize/2)-5,y-(Ysize/2)+5,Xsize,Ysize);
    ellipse(x-(Xsize/2),y-Ysize,20,Ysize);
    rect(x-(Xsize/2),y-(Ysize/2),Xsize,Ysize);
    rect(x-(Xsize/2),y-(3*Ysize/2),Xsize,Ysize);
    fill(200,100,100); //inner box
    rect(x-(Xsize/2)+innerSize,y-(Ysize/2)+innerSize,Xsize-(innerSize*2),Ysize-(innerSize*2));
    fill(0,0,0); //box hinges
    rect(x-(Xsize/4)-innerSize*2,y-(Ysize/2),innerSize*4,innerSize);
    rect(x+(Xsize/4)-innerSize*2,y-(Ysize/2),innerSize*4,innerSize);
  }
  
  void move() {
    x-=beltSpeed;
  }
  
  void checkBox() {
    if (x<-50 && scoreChecked == false){ //check toolbox at end of belt
      if (toolsCount[this.index]>=3){ //if toolbox has 3 tools
        score+=1;
      }
      else{
        //end game#
        fill(255,255,255);
        textSize(100);
        text("You lose!",width/4,height/2-25);
        for (int i = tools.size() - 1; i >= 0; i--) {
          if (tools.get(i).y<470)//only tools not in toolbox
            tools.remove(i);//deleting all tools on screen
        }
        gameRunning=false;
      }
      scoreChecked=true;
    }
  }
  
  void update() {
    move();
    render();
    checkBox();
  }
}
