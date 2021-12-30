class Level_2 {
int score=0;
Frog frog;
path paths[];
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
//float arrRnd[][]=new float [2][5];
//PShape Icar[]= new PShape[3];
//PImage IcarI[]=new PImage[2];
  Level_2()
  { 
     rect1=new rectangle(0 ,height-1.25*grid ,width,1.25*grid);
     rect2=new rectangle(0 ,height-3*1.25*grid ,width,2*1.25*grid);
     rect3=new rectangle(0 ,height-4*1.25*grid ,width,1.25*grid);
     rect4=new rectangle(0 ,height-7*1.25*grid ,width,3*1.25*grid);
     rect5=new rectangle(0 ,0,width,1.25*grid);
     rectFinal=new rectangle(width-grid,0,grid,1.25*grid); //winning
     
     IRec2=loadImage("data/images/road.jpg"); //road
     IRec3=loadImage("data/images/green2.jpg"); //grass
     IRec4=loadImage("data/frog9.png");
     //blue_car=loadImage("data/images/car1.png");//blue car
    score=0;
    timer = new Timer(65);
    frog = new Frog(width/2-(0.75*grid)/2, height-0.75*grid, 0.75*grid);
    
    paths =  new path[36];
    coin = new Coin[12];
    cars = new Car[6];
    
    // muv car array
    muv_cars = new Car[6];
  // row1
   int in =0;
    for(int i=0; i<3 ;i++){
     // float x = (width-grid)+ 420*i;
     float x=i*300+grid; //width of car=100 
      muv_cars[in] = new Car(x, height- 6.2*grid, 140 , 85,15,in);
      in++;
    }
    for(int i=0; i<3 ;i++){
      float x =  width-i*300-grid;
     muv_cars[in] = new Car(x, height-8.3*grid, 140 , 85,-15,in);
     in++;
    }
  /*
    int in =0;
    for(int i=0; i<3 ;i++){
     // float x = (width-grid)+ 420*i;
     float x=i*50+150;
    cars1[in++] = new Car(x, height- 6.6*grid, 100 , 85,50);
    
    }
    //row2
    for(int i=0; i<2 ;i++){
      float x =  430*i;
    cars1[in++] = new Car(x, height-8*grid, 140 , 85,-70);
    }
    
    
   for(int i=0;i<5;i++)
   {
     arrRnd[0][i]=random(0,width);
     arrRnd[1][i]=random(rect2.y,rect2.y+rect2.h-50);
    } 
      Icar[0]=loadShape("data/images/car9.svg");
      Icar[1]=Icar[0];
      Icar[2]=Icar[0];
      IcarI[0]=blue_car;
      IcarI[1]=blue_car;
      */
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
        y= height- grid - i*3*1.25*grid;
    }
    else{
          y= height- grid - i*3*1.45*grid;
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
       /*
       cars[0]=new Car(arrRnd[0][0],arrRnd[1][0],150,75,0,0);
       
       boolean bb=true;
       for(int i=1;i<5;i++)
       {   
         cars[i]=new Car(arrRnd[0][i],arrRnd[1][i],150,75,0,i);
         for(int j=0;j<=i;j++)
         {
             if(!(cars[i].intersect(cars[j])) && bb==true)
             {  bb=false;
                
             }
             else {
               break;
             }
         }
         if(!bb)
         {
          // shape(Icar[i],cars[i].x,cars[i].y,cars[i].w,cars[i].h);
         }
         bb=true;
        } */
        
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
          frog.w=0;
          over=new gameOver(0,0,width,height);
          over.endgame();
        }
       else{
        frog.x=0.25*grid;
        frog.y=height-0.75*grid;
        resetGame();
         }
    }
  if( (frog.intersect(rectFinal))) //win
  {
    Passed= new passedLevel(0,0,width,height);
    Passed.win(2);
    gameScreen=3;
    level3.lives=4;
    resetGame();
      redraw();
  }
        
  timer.countDown(); 
  time=timer.getTime();
  if(time<=0){
    for (Coin coins : coin) {
     coins.x=-100;
       coins.y=-100;
    }
    frog.w=0;
    
  over=new gameOver(0,0,width,height);
         over.endgame();
  }
        //show coins
  for (Coin coins : coin) {
      coins.showCoin();
    if (frog.intersect(coins)){
      //if( (frog.x>= coins.x && index%2==0 ) || (frog.x<= coins.x && index%2!=0 ) ){
      
       coins.x=-100;
       coins.y=-100;
       this.score+=1;
       
    }
    }
    
   // move_car();
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
  }/*
  else if(keyCode== ' ' ){ //win
    gameScreen=3;
    this.lives=4;
    resetGame();
      redraw();
  }*/
  else {
    frog.showUp();
  }
  
   play(2);
   }//end draw
   

   
   }//end class
   
