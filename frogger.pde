Frog frog;
path paths[];
float grid = 100;
rectangle rect,rect2,rect3,rect4;
GameMenu gamemenu;
GuideScreen guidescreen;
PImage bg,bgGuide,bgEnd;
int gameScreen = 0;

//reset
void resetGame() {
  frog = new Frog(0.25*grid, height-0.75*grid, 0.75*grid);
  paths =  new path[36];
  draw_path();
  frog.showUp();
  
}

//resume
void resume()
{
  

}


//setup
void setup(){
  size(1000,1000 );
  resetGame();
  gamemenu = new GameMenu();
  guidescreen =new GuideScreen();
  bg = loadImage("data/frogger800-650.jpeg");
  bgGuide =loadImage("data/froggerGuide800-650.png");
  bgEnd=loadImage("data/froggerWin800-650.jpeg");
  rectMode(CENTER); //center the rectangle
  stroke(245, 245, 245); //button border
  textSize(45); //text inside buttons
  noStroke();
  //path
rect=new rectangle(1.25*grid,height-(1.25*grid),width-1.25*grid,1.25*grid);
rect2=new rectangle(0,height-3*1.25*grid,width-1.25*grid,1.25*grid);
rect3=new rectangle(1.25*grid,height-5*1.25*grid,width-1.25*grid,1.25*grid);
rect4=new rectangle(0,height-7*1.25*grid,width-1.25*grid,1.25*grid);
}

//draw
void draw(){
  //secondScreen();
  
  if (gameScreen == 0) {
  firstScreen();
}
else if (gameScreen == 1) {
    secondScreen();
    //TimerDisplay();
    //playerScore();
}
else if (gameScreen == 2) {
    thirdScreen();
  } 
else if (gameScreen == 3) {
    fourthScreen();
    //TimerReset();
  }

}


//game menu first screen
void firstScreen() {
  gameScreen = 0; 
  bg.resize(1000,1000);
  background(bg);
  gamemenu.startMenu();
}

//gameplay second screen
void secondScreen()
{
  gameScreen = 1; 
  background(255);
  rect.DrawRec();
  rect2.DrawRec();
  rect3.DrawRec();
  rect4.DrawRec();
  for (path pat : paths) {
    pat.show();
   /* if ((frog.intersect(pat))) {
      resetGame();
   }*/
   if(frog.intersect(rect) || frog.intersect(rect2) || frog.intersect(rect3) || frog.intersect(rect4))
   {
        resetGame();
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
  else if (keyCode == ALT)
  {
    //exit(); 
   firstScreen();
   //gameScreen=0;
  }
  else{
    frog.showUp();
  }
}

}


// third screen
void thirdScreen()
{
  gameScreen = 2; 
  bgGuide.resize(1000,1000);
  background(bgGuide); 
  draw_back();
  guidescreen.GuideText();
  guidescreen.GuideMenu();

}

// third screen
void fourthScreen()
{
gameScreen = 3; 
bgEnd.resize(1000,1000);
background(bgEnd);
//endscreen.EndText();
//endscreen.EndMenu();
}


//movement
void keyPressed()
{
  if (keyPressed){
    if (keyCode == UP  && frog.y>0 ){
      frog.move(0,-1);
    }
    else if (keyCode == LEFT &&  frog.x>0){
      frog.move(-1,0);
    }
    else if (keyCode == DOWN && frog.y+frog.h<height){
      frog.move(0,1);
    }
    else if (keyCode == RIGHT && frog.x+frog.w<width){
      frog.move(1,0);
    }
  }
}

//path for first level
void draw_path()
{
  //row1
  
  int index=0;
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

}
void draw_back()
{
  int i=1;
  fill(0);
  //ellipse(38*i,25*i,i*40,i*40);
  ellipse(45*i,45*i,i*40,i*40);
  fill(255,255,255);
  beginShape();
  vertex(i*30,45*i);
  vertex(40*i,35*i);
  vertex(40*i,40*i);
  vertex(55*i,40*i);
  vertex(55*i,50*i);
  vertex(40*i,50*i);
  vertex(40*i,55*i);
  endShape(CLOSE);
  
  if (mouseX > 18 && mouseX < 58
      && mouseY > 5 && mouseY < 45) { //pointer collision with Button1
    i=2;
  background(bgGuide); 
  fill(0);
  ellipse(38*i,25*i,i*40,i*40);
  fill(255,255,255);
  beginShape();
  vertex(i*25,25*i);
  vertex(35*i,15*i);
  vertex(35*i,20*i);
  vertex(50*i,20*i);
  vertex(50*i,30*i);
  vertex(35*i,30*i);
  vertex(35*i,35*i);
  endShape(CLOSE);
  if (mousePressed){ 
          gameScreen=0; //menue
        }
      }
}
