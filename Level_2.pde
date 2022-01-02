class Level_2 {
        int score=0;
        Frog frog;
        Coin coin[];
        int lives=4;
        Timer timer; 
        float time;
        float grid = 100;
        Car cars[];
        // muv car
        Car muv_cars[];

rectangle rect1,rect2,rect3,rect4,rect5,rectFinal;
PImage IRec2,IRec3,IRec4;

Level_2()
  { 
     rect1=new rectangle(0 ,height-1.25*grid ,width,1.25*grid);
     rect2=new rectangle(0 ,height-3*1.25*grid ,width,2*1.25*grid);
     rect3=new rectangle(0 ,height-4*1.25*grid ,width,1.25*grid);
     rect4=new rectangle(0 ,height-7*1.25*grid ,width,3*1.25*grid);
     rect5=new rectangle(0 ,0,width,1.25*grid);
     
     rectFinal=new rectangle(width-grid,0,grid,1.25*grid); //winning rect
     
     IRec2=loadImage("data/images/road.jpg"); //road
     IRec3=loadImage("data/images/green2.jpg"); //grass
     IRec4=loadImage("data/images/frog9.png");
     
    score=0;
    timer = new Timer(65);
    frog = new Frog(width/2-(0.75*grid)/2, height-0.75*grid, 0.75*grid);
    
    coin = new Coin[12];
    cars = new Car[6];
    
    // muv car array
    muv_cars = new Car[6];
  // row1
    int in =0;
    for(int i=0; i<3 ;i++){
    
     float x=i*300+grid; //width of car=100 
      muv_cars[in] = new Car(x, height- 6.2*grid, 140 , 85,15,in);
      in++;
    }
    for(int i=0; i<3 ;i++){
      float x =  width-i*300-grid;
     muv_cars[in] = new Car(x, height-8.3*grid, 140 , 85,-15,in);
     in++;
    }
  
      for(int i=0;i<3;i++) // fixed cars
      {
        cars[i]=new Car(i*300+grid,height-3*1.25*grid+40,150,75,0,0);
      }
      int j=0;
      for(int i=3;i<6;i++) // fixed cars
      {
        cars[i]=new Car(width-j*300-150,height-3*1.25*grid+150,150,75,0,0);
        j++;
      }
  }
  
  
  void coinarray(){
  int k=0;
 for ( int i =0; i<3; i++){
    for(int j =0; j<4; j++){
    float x=0.75*grid + j*250;
      float y;
    if (i <= 1){
        y= height- grid - i*3*1.25*grid+20;
    }
    else{
          y= height- grid - i*3*1.45*grid+25;
    }
    coin[k++]= new Coin(x , y, 80);
   
    }
  }


}//end coinarray.
  
   void Drawlevel2()
   {  
     
     //back ground
      image(IRec2,rect2.x,rect2.y,rect2.w,rect2.h);
      image(IRec2,rect4.x,rect4.y,rect4.w,rect4.h);
      image(IRec3,rect1.x,rect1.y,rect1.w,rect1.h);
      image(IRec3,rect3.x,rect3.y,rect3.w,rect3.h);
      image(IRec3,rect5.x,rect5.y,rect5.w,rect5.h);
      image(IRec4,rectFinal.x,rectFinal.y,rectFinal.w,rectFinal.h);
      
       //show  muv car
       for(int i=0;i<3;i++){ //go to right
       muv_cars[i].ShowCar('R');
       cars[i].ShowCar('R');
       muv_cars[i].update();
       }
       for(int i=3;i<6;i++){ //go to left
       muv_cars[i].ShowCar('B');
       cars[i].ShowCar('B');
       muv_cars[i].update();
       }
       //cars in row road one
     
        
        //intersect car
            if( (frog.intersect(muv_cars[0])) || (frog.intersect(muv_cars[1])) || (frog.intersect(muv_cars[2]))
            || (frog.intersect(muv_cars[3])) || (frog.intersect(muv_cars[4])) || (frog.intersect(muv_cars[5]))
            || (frog.intersect(cars[0])) || (frog.intersect(cars[1])) || (frog.intersect(cars[2]))
            || (frog.intersect(cars[3]))  ||  (frog.intersect(cars[4])) ||  (frog.intersect(cars[5])))
   {
        if (this.lives == 1 ){
         for (Coin coins : coin) {
            coins.x=-100;
            coins.y=-100;
           }
          frog.x=-100;
          l=2;
          gameScreen =4;
        }
       else{ 
        frog.x=width/2-(0.75*grid)/2;
        frog.y=height-0.75*grid;
        resetGame();
         }
    }
  if( (frog.intersect(rectFinal))) //win
  {
   
      frog.x=-100;
      for (Coin coins : level2.coin) {
            coins.x=-100;
            coins.y=-100;
           }
    gameScreen=3;
    level3.lives=4;
    resetGame();
      redraw();
  }
        
  timer.countDown(); 
  time=timer.getTime();
  if(time<=0 && this.lives==1){
    for (Coin coins : coin) {
     coins.x=-100;
       coins.y=-100;
    }
    frog.x=-100;
    
    l=2;
    gameScreen =4;
  }
  else if (time<=0)
  {
    frog.x=width/2-(0.75*grid)/2;
    frog.y=height-0.75*grid;
    resetGame();
  }
        //show coins
  for (Coin coins : coin) {
      coins.showCoin();
    if (frog.intersect(coins)){
       coins.x=-100;
       coins.y=-100;
       this.score+=1;
       
    }
    }
    
   
         //frog
  if (keyCode == UP){
    frog.showUp();
   }
  else if (keyCode == LEFT){
    frog.showLeft();
  }
  else if (keyCode == DOWN){
    frog.showDown();
  }
  else if (keyCode == RIGHT){
    frog.showRight();
  }
  else if (keyCode == ENTER){
    timer.stopTime();
    resume resume=new resume(500,500,500,500);
    resume.show_resume();
  }
  else if(keyCode== ' '  && (this.lives==1 || time<=0)){
    gameScreen=2;
    this.lives=4;
    resetGame();
      redraw();
  }
  else {
    frog.showUp();
  }
  
   play(2);
   }//end draw
   

   
   }//end class
   
