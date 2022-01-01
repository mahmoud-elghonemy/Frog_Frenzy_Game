int gameScreen = 1;
int l=0;
//gameOver over;
//passedLevel Passed;
GameMenu gamemenu;
GuideScreen guidescreen;
PImage bg,bgGuide,bgEnd,loss;
PFont font;
float grid = 100;
PShape cuore;
Frog frog;
Timer timer; 
level1 Level1;
Level_2 level2;
Level_3 level3;
//import sound library
import processing.sound.*; //sound is package
SoundFile file;     //soundFile is class 
  
//attaching audio file
String audioName = "data/frogger-sound.wav"; 
String p;

void setup(){
  Level1 = new level1();
  level2=new Level_2();
  level3=new Level_3();
  resetGame();
  loss=loadImage("lossfrog.jpeg");
  loss.resize(600,300);
  font = loadFont("ArialUnicodeMS-48.vlw");
  textFont(font);
  
  cuore = loadShape("cuore.svg");
  
  size(990,1000);
  
  noStroke();
  
   //Audio file loading 
   p = sketchPath(audioName);
  file = new SoundFile(this, p);
  
  gamemenu = new GameMenu();
  guidescreen =new GuideScreen();
  bg = loadImage("data/images/intro game.png");
  bgGuide =loadImage("data/images/froggerGuide800-650.png");
  bgEnd=loadImage("data/images/froggerWin800-650.jpeg");
  rectMode(CENTER); //center the rectangle
  stroke(245, 245, 245); //button border
  textSize(45); //text inside buttons
  noStroke();
}

void resetGame() {
if(gameScreen==1){
 Level1.score=0;
 Level1.lives --; 
 Level1.timer = new Timer(65);
 Level1.coinarray();  

 }
 else if (gameScreen==2)
  {
 level2.lives --; 
 level2.score=Level1.score;
 level2.timer = new Timer(65);
 level2.coinarray();
 
  }
  else if (gameScreen==3)
  {
 frog = new Frog(width/2-(0.75*grid)/2, height-0.75*grid, 0.75*grid);
 level3.lives --; 
 level3.score=level2.score;
 level3.timer = new Timer(65);
 level3.coinarray();  
 level3.logsArray();
 level3.frog.attach(null);
  }
}

void draw(){
  if (gameScreen == 0) {
  firstScreen();
}
else if (gameScreen == 1) {
    Level1.drawlevel1();
}
else if (gameScreen == 5) {
    thirdScreen();
  } 
else if (gameScreen == 6) {
    fourthScreen();
  }
else if(gameScreen ==2)
  {
    level2.Drawlevel2();
  }
  else if(gameScreen ==3)
  {
    level3.Drawlevel3();
  }
else if(gameScreen ==4)
  {
    gameScreen=4;
    endgame();
    
  }
}

//game menu first screen
void firstScreen() {
  gameScreen = 0; 
  bg.resize(990,1000);
  background(bg);
  gamemenu.startMenu();
}
   
// third screen
void thirdScreen()
{
  gameScreen = 5; 
  bgGuide.resize(990,1000);
  background(bgGuide); 
  draw_back();
  guidescreen.GuideText();
  guidescreen.GuideMenu();

}

// third screen end game
void fourthScreen()
{
gameScreen = 6; 
bgEnd.resize(990,1000);
background(bgEnd);
text("Congratulations!.you passed all levels",width/2-(textWidth("press spacepar to play next level") / 2),850);

}

void endgame(){
     
     background(70,55,113,300);
     image(loss,200,150);
     textSize(100); 
     text("GAME OVER",width/2-textWidth("GAME OVER")/2,550);
     textSize(50); 
     text("press spacepar to play again",width/2-textWidth("press spacepar to play again")/2,650);
   
   if(keyCode== ' '){
     if (l==1 )
     {
      gameScreen=1;
       Level1.frog.x=0.25*grid;
       Level1.frog.y=height-0.75*grid;
      Level1.lives=4;
     }
     
     else if (l==2)
     {
      gameScreen=2;
      level2.frog.x=width/2-(0.75*grid)/2;
      level2.frog.y=height-0.75*grid;
      level2.lives=4;
     }
     else if (l==3)
     {
      gameScreen=3;
      level3.frog.x=width/2-(0.75*grid)/2;
      level3.frog.y=height-0.75*grid;
      level3.lives=4;
     }
     resetGame();
      redraw();
  }
}

void keyPressed()
{
  if (keyPressed){
    if(gameScreen==1){
    if (keyCode == UP){
      Level1.frog.move(0,-1);
    }
    else if (keyCode == LEFT ){
      Level1.frog.move(-1,0);
    }
    else if (keyCode == DOWN ){
      Level1.frog.move(0,1);
    }
    else if (keyCode == RIGHT ){
      Level1.frog.move(1,0);
    }
    else if (keyCode == ENTER){
    resume resume=new resume(500,500,500,500);
    resume.show_resume();
  }
    else  if(keyCode== ' ') {
      if( (Level1.lives==0 || Level1.time<=0))
      {
      Level1.lives=4;
      resetGame();
    //  loop();
      redraw();
      }
      
    }
    else
      {
     
        level2.lives=4;
        resetGame();
        redraw();
      }
  }
  
  if(gameScreen==2){
    if (keyCode == UP){
      level2.frog.move(0,-1);
    }
    else if (keyCode == LEFT ){
      level2.frog.move(-1,0);
    }
    else if (keyCode == DOWN ){
      level2.frog.move(0,1);
    }
    else if (keyCode == RIGHT ){
      level2.frog.move(1,0);
    }
    else if (keyCode == ENTER){
    resume resume=new resume(500,500,500,500);
    resume.show_resume();
  }
    else  if(keyCode== ' ') {
    
      if( (level2.lives==1 || level2.time<=0))
      {
      level2.lives=4;
      resetGame();
  
      redraw();
      }
     
    }
  }
  //
  
  if(gameScreen==3){
    if (keyCode == UP){
      level3.frog.move(0,-1);
    }
    else if (keyCode == LEFT ){
      level3.frog.move(-1,0);
    }
    else if (keyCode == DOWN ){
      level3.frog.move(0,1);
    }
    else if (keyCode == RIGHT ){
      level3.frog.move(1,0);
    }
    else if (keyCode == ENTER){
    resume resume=new resume(500,500,500,500);
    resume.show_resume();
  }
    else  if(keyCode== ' ') {
      if( (level3.lives==1 || level3.time<=0))
      {
      level3.lives=4;
      resetGame();
   
      redraw();
      }
     
    }
  }
  
  
  
 }
}

void draw_back()
{
  int i=1;
  fill(0);
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

void play(int gameScreen)
{
textSize(30);
fill(225,255,255);
if(gameScreen == 1)
{
  text("Level:1 ",width/2-textWidth("Level:1 ")/2-50,30);
  text("score: "+ Level1.score,0,60);
  text("Time: "+ round(Level1.time),0,100);
  for(int i=0; i<Level1.lives; i++){
  shape(cuore, 100+i*40, 10, 30,30);
 }
}
else if(gameScreen == 2)
{
  text("Level:2 ",width/2-textWidth("Level:2 ")/2,60);
  text("score: "+ level2.score,0,60);
text("Time: "+ round(level2.time),0,100);
 for(int i=0; i<level2.lives; i++){
  shape(cuore, 10+i*40, 10, 30,30);
 }
}
else if(gameScreen == 3)
{
text("Level:3 ",width/2-textWidth("Level:3 ")/2,60);
text("score: "+ level3.score,0,60);
text("Time: "+ round(level3.time),0,100);
 for(int i=0; i<level3.lives; i++){
  shape(cuore, 10+i*40, 10, 30,30);
 }
 }
}
