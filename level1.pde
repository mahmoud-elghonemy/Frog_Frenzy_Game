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
level1(){
    this.score=0;
    this.timer = new Timer(65);
    this.frog = new Frog(0.25*grid, height-0.75*grid, 0.75*grid);
    this.paths =  new path[36];
    this.coin = new Coin[16];  
  
  
  rect=new rectangle(1.25*grid,height-(1.25*grid),width-1.25*grid,1.25*grid);
  rect2=new rectangle(0,height-3*1.25*grid,width-1.25*grid,1.25*grid);
  rect3=new rectangle(1.25*grid,height-5*1.25*grid,width-1.25*grid,1.25*grid);
  rect4=new rectangle(0,height-7*1.25*grid,width-1.25*grid,1.25*grid);
  
  //row1
 // int index=0;
   for (int i = 0; i < 2; i++) {
    float x =0;
    float y= height-1.25*grid-1.25*i*grid;
    paths[index] = new path(x, y, 1.25*grid, 1.25*grid);
    index++;
  }
 
  //row2
   
  
  for (int i = 0; i < 7; i++) {
   float x = 1.25*grid+i*1.25*grid;
   float y= height-2*1.25*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  
  //row3
   for (int i = 0; i < 2; i++) {
    float x = width-1.25*grid;
  float y= height-3*1.25*grid-1.25*i*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
    index++;
  }
  
  //row4
   for (int i = 0; i < 7; i++) {
   float x = width-2*1.25*grid-i*grid*1.25;
   float y= height-4*1.25*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  
  //row5
   for (int i = 0; i < 2; i++) {
    float x = 0;
    float y= height-5*1.25*grid-i*grid*1.25;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
    index++;
  }
  
  //row6
   for (int i = 0; i < 7; i++) {
   float x = 1.25*grid+i*1.25*grid;
   float y= height-6*1.25*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  //row7
    for (int i = 0; i < 2; i++) {
    float x = width-1.25*grid;
    float y= height-7*1.25*grid-i*grid*1.25;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
    index++;
  }
  //row8
   for (int i = 0; i < 7; i++) {
   float x =i*grid*1.25;
   float y= 0;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  
  }//end constractor
  
void coinarray(){
  int k=0;
 for ( int i =0; i<4; i++){
    for(int j =0; j<4; j++){
    float x=2.5*grid + j*150;
    float y= height- 1.75*1.25*grid-i*2*1.25*grid;
    coin[k++]= new Coin(x , y, 80);
    }
  }


}//end coinarray.

void drawlevel1(){

 background(255);
  rect.DrawRec();
  rect2.DrawRec();
  rect3.DrawRec();
  rect4.DrawRec();
 
  //coinreset();
  
 // c.showCoin();
  for (path pat : paths) {
    pat.show();
    if(frog.intersect(paths[29])){
      Passed= new passedLevel(0,0,width,height);
      Passed.win(1);
    }
    if(frog.intersect(rect) || frog.intersect(rect2) || frog.intersect(rect3) || frog.intersect(rect4))
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
    
   
  for (Coin coins : coin) {
    coins.showCoin();
    if (frog.intersect(coins)){
      //if( (frog.x>= coins.x && index%2==0 ) || (frog.x<= coins.x && index%2!=0 ) ){
      
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
    resume resume=new resume(500,500,500,500);
    resume.show_resume();
  }
  else if(keyCode== ' ' && (lives==0 || time==0)){
    gameScreen=1;
      resetGame();
      lives=4;
      score=0;
      this.timer.setTime(65);
      //loop();
      redraw();
  }else {
    frog.showUp();
  }
play();
}
//end draw
void play()
{
  textSize(40);
fill(0);
text("score: "+ score,width-200,50);
text("Time: "+ round(time),width-200,100);
 for(int i=0; i<this.lives; i++){
  shape(cuore, 10+i*40, 10, 30,30);
 }
}
}
