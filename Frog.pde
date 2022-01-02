class Frog extends rectangle{
    PImage up, left, right, down;  //images
    Log attached = null;
  //constructor
  Frog(float x, float y, float w){
     super(x,y,w, w);
     
     //loading images
     up = loadImage("data/images/up.png");
     up.resize((int)w, (int)w);
     
     down = loadImage("data/images/down.png");
     down.resize((int)w, (int)w);
     
     left = loadImage("data/images/left.png");
     left.resize((int)w, (int)w);
     
     right = loadImage("data/images/right.png");
     right.resize((int)w, (int)w);
  }
  
  // attach log
  void attach(Log log) {
    attached = log;
  }
  
   
  //frog up
  void showUp()
  {
    image(up, this.x, this.y-25);
  }

  //frog down
  void showDown()
  {
    image(down, x, y-25);
  }

  //frog left
  void showLeft()
  {
    image(left, x, y-25);
  }

  //frog right
  void showRight()
  {
    image(right, x, y-25);
  }
  
   
  void update()
  {  
     //
     if (attached != null) {
      x += attached.speed;
    }

     x = constrain(x, 0, width-w);
  }
    
  //move
  void move(float xdir, float ydir)
  {
    
    x += xdir *1.25*grid;
    y += ydir *1.25*grid;
    x =constrain(x,0,width-w);
    y=constrain(y,+25,height-h);
   
  }
   
}
