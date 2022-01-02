class level1{
              float time;
              int score=0;
              Frog frog;
              path paths[];
              Coin coin[];
              int lives=4;
              Timer timer; 
              int index=0;
              rectangle rect,rect2,rect3,rect4;
               PImage  water;
level1(){
        water = loadImage("data/images/water.jpg");
      water.resize(680,680);
    this.score=0;
    this.timer = new Timer(65);
    this.frog = new Frog(0.15*grid, height-0.65*grid, 0.65*grid);
    this.paths =  new path[36];
    this.coin = new Coin[16];  
    
  rect=new rectangle(grid,height-grid,width-grid,grid);
  rect2=new rectangle(0,height-3*grid,width-grid,grid);
  rect3=new rectangle(grid,height-5*grid,width-grid,grid);
  rect4=new rectangle(0,height-7*grid,width-grid,grid);
  
  draw_path();
  }//end constractor
  float x;
void coinarray(){
  int k=0;
 for ( int i =0; i<4; i++){
    for(int j =0; j<4; j++){
      
     x=2*grid + j*85+50;
    float y= height- 1.75*1*grid-i*2*1*grid+20;
    coin[k++]= new Coin(x , y, 60);
    }
  }


}//end coinarray.

void drawlevel1(){

 background(water);
  rect.DrawRec();
  rect2.DrawRec();
  rect3.DrawRec();
  rect4.DrawRec();
 

  for (path pat : paths) {
    pat.show();
    //when finsh level one 
    if(frog.intersect(paths[29])){
    
    frog.x=-100;
    for (Coin coins : Level1.coin) {
            coins.x=-100;
            coins.y=-100;
           }
      gameScreen=2; //level2
      level2.lives=4;
      resetGame();
      redraw();
    }
    if(frog.intersect(rect) || frog.intersect(rect2) || frog.intersect(rect3) || frog.intersect(rect4))
   {
        if (this.lives == 1 ){
         for (Coin coins : coin) {
            coins.x=-100;
            coins.y=-100;
           }
          frog.x=-100;
       
       l=1;
       gameScreen=4; 
        }
       else{
        frog.x=0.15*grid;
        frog.y=height-0.65*grid;
        resetGame();
         }
    }
  }
  
  timer.countDown(); 
  time=timer.getTime();
  if(time<=0 && this.lives==1){
   for (Coin coins : coin) {
     coins.x=-100;
       coins.y=-100;
    }
    frog.x=-100;
  

      l=1;
      gameScreen =4; //game over
         
  }
   else if(time<=0)
   {
          frog.x=0.15*grid;
        frog.y=height-0.65*grid;
        resetGame();
   }
  for (Coin coins : coin) {
    coins.showCoin();
    if (frog.intersect(coins)){
       coins.x=-100;
       coins.y=-100;
       score+=1;
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
     resume resume=new resume(140,140,400,400);
    resume.show_resume();
  }
  else if(keyCode== ' ' && (lives==0)){
      gameScreen=1;
      this.lives=4;
      resetGame();
      redraw();
  }
  else {
    frog.showUp();
  }
play(1); //inital wrtite level one and time in screen 
}
//end draw
void draw_path()
{
  //row1
  int index=0;
   for (int i = 0; i < 2; i++) {
    float x =0;
    float y= height-1*grid-1*i*grid;
    paths[index] = new path(x, y, 1*grid, 1*grid);
    index++;
  }
 
  //row2
   
  
  for (int i = 0; i < 7; i++) {
   float x = 1*grid+i*1*grid;
   float y= height-2*1*grid;
    paths[index] = new path(x, y, grid*1, grid*1);
   index++;
  }
  
  //row3
   for (int i = 0; i < 2; i++) {
    float x = width-1*grid;
  float y= height-3*1*grid-1*i*grid;
    paths[index] = new path(x, y, grid*1, grid*1);
    index++;
  }
  
  //row4
   for (int i = 0; i < 7; i++) {
   float x = width-2*1*grid-i*grid*1;
   float y= height-4*1*grid;
    paths[index] = new path(x, y, grid*1, grid*1);
   index++;
  }
  
  //row5
   for (int i = 0; i < 2; i++) {
    float x = 0;
    float y= height-5*1*grid-i*grid*1;
    paths[index] = new path(x, y, grid*1, grid*1);
    index++;
  }
  
  //row6
   for (int i = 0; i < 7; i++) {
   float x = 1*grid+i*1*grid;
   float y= height-6*grid;
    paths[index] = new path(x, y, grid*1, grid*1);
   index++;
  }
  //row7
    for (int i = 0; i < 2; i++) {
    float x = width-1*grid;
    float y= height-7*1*grid-i*grid*1;
    paths[index] = new path(x, y, grid*1, grid*1);
    index++;
  }
  //row8
   for (int i = 0; i < 7; i++) {
   float x =i*grid*1;
   float y= 0;
    paths[index] = new path(x, y, grid*1, grid*1);
   index++;
  }
}
}
