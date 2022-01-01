class Level_3 {
int score=0;
int lives=4;
Frog frog;
Coin coin[];
Timer timer; 
float time;
float grid = 100;
Log log[];
// muv car
Car muv_cars[];
rectangle rect1,rect2,rect3,rect4,rect5,rectFinal;
PImage IRec1,IRec2,IRec3,IRec4;
boolean ok = false;
Level_3()
{
     ok = false;
     rect1=new rectangle(0 ,height-1.25*grid ,width,1.25*grid);
     rect2=new rectangle(0 ,height-3*1.25*grid ,width,2*1.25*grid);
     rect3=new rectangle(0 ,height-4*1.25*grid ,width,1.25*grid);
     rect4=new rectangle(0 ,height-7*1.25*grid ,width,3*1.25*grid);
     rect5=new rectangle(0 ,0,width,1.25*grid);
     rectFinal=new rectangle(width-grid,0,grid,1.25*grid); //winning
     
     IRec1=loadImage("data/images/water.jpg"); //water
     IRec2=loadImage("data/images/road.jpg"); //road
     IRec3=loadImage("data/images/green2.jpg"); //grass
     IRec4=loadImage("data/frog9.png"); //win
     coin = new Coin[12];
      //log
     
    score=0;
    timer = new Timer(65);
    frog = new Frog(width/2-(0.75*grid)/2, height-0.75*grid, 0.75*grid);
    
    // muv car array
    muv_cars = new Car[6];
  // row1
   int in =0;
    for(int i=0; i<3 ;i++){
     
     float x=i*300+grid; //width of car=100 
      muv_cars[in] = new Car(x, height-3*1.25*grid+40, 140 , 85,20,in);
      in++;
      //row2
    }
    for(int i=0; i<3 ;i++){
      float x =  width-i*300-grid;
     muv_cars[in] = new Car(x, height-3*1.25*grid+150, 140 , 85,-15,in);
     in++;
    }
    
    log = new Log[7];
}
 void logsArray(){
     
  // ROW 3
    int in=0;
  for (int i = 0; i < 2; i++) {
    float x = i * 450 + 100;
    log[in] = new Log(x, height-grid*6, 3*grid, 0.7*grid, 20,in);
    in++;
  }
  // ROW 4
  for (int i = 0; i < 3; i++) {
    float x = i * 400 + 30;
    log[in] = new Log(x, height-grid*7.2, grid*2.5,0.7* grid, -15,in);
    in++;
  }
  // ROW 5
  for (int i = 0; i < 2; i++) {
    float x = i * 430 + 10;
    log[in] = new Log(x, height-grid*8.4, grid*3, 0.7*grid, 10,in);
    in++;
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
  }}

void Drawlevel3()
{
  //back ground
      image(IRec3,rect1.x,rect1.y,rect1.w,rect1.h);
      image(IRec2,rect2.x,rect2.y,rect2.w,rect2.h);
      image(IRec3,rect3.x,rect3.y,rect3.w,rect3.h);
      image(IRec1,rect4.x,rect4.y,rect4.w,rect4.h);
      image(IRec3,rect5.x,rect5.y,rect5.w,rect5.h);
      image(IRec4,rectFinal.x,rectFinal.y,rectFinal.w,rectFinal.h);
      
       //show  muv car
       for(int i=0;i<3;i++){ //go to right
       muv_cars[i].ShowCar('R');
       muv_cars[i].update();
       }
       for(int i=3;i<6;i++){ //go to left
       muv_cars[i].ShowCar('B');
       muv_cars[i].update();
       }
       
                   //intersect car
 if( (frog.intersect(muv_cars[0])) || (frog.intersect(muv_cars[1])) || (frog.intersect(muv_cars[2]))
  || (frog.intersect(muv_cars[3])) || (frog.intersect(muv_cars[4])) || (frog.intersect(muv_cars[5]))
   
)
   {
        if (this.lives == 1 ){
          for (Coin coins : coin) {
            coins.x=-100;
            coins.y=-100;
           } 
           for (Log logs : log) {
            logs.x=-100;
            logs.y=-100;
           } 
          frog.x=-100;
         l=3;
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
  
    level3.frog.x=-100;
    gameScreen=6;
    gameScreen=6;
    resetGame();
      redraw();
  }
        
  timer.countDown(); 
  time=timer.getTime();
  if(time<=0 && this.lives ==1){
    frog.x=-100;
      l=3;
      gameScreen=4;
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
    
    //logs
    for(Log logs: log){
    logs.ShowCar('l');
    logs.update();
    }
    if (frog.intersect(rect4)) {
    boolean ok = false;
    for (Log log : log) {
      if (frog.intersect(log)) {
        ok = true;
        frog.attach(log);
      }
    
    }

    if (!ok ) {
          if (this.lives == 1 ){
          for (Coin coins : coin) {
            coins.x=-100;
            coins.y=-100;
           } 
           for (Log logs : log) {
            logs.x=-100;
            logs.y=-100;
           } 
          frog.x=-100;
          l=3;
          gameScreen=4;
        }
        else{
      frog.x=0.25*grid;
      frog.y=height-0.75*grid;
      resetGame();}
    
  } }
  else {
    frog.attach(null);
  }

  frog.update();
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
    gameScreen=3;
    this.lives=4;
    resetGame();
      redraw();
  }

  else {
    frog.showUp();
  }
  
   play(3);
}

}
