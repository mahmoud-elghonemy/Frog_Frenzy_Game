int gameScreen = 0;
gameOver over;
passedLevel Passed;
GameMenu gamemenu;
GuideScreen guidescreen;
PImage bg,bgGuide,bgEnd;
PFont font;
float grid = 100;
PShape cuore;
Timer timer; 
level1 Level1;
Level_2 level2;
//import sound library
import processing.sound.*; //sound is package
SoundFile file;     //soundFile is class 
  
//attaching audio file
String audioName = "data/frogger-sound.wav"; 
String p;
void setup(){
  Level1 = new level1();
  level2=new Level_2();
  resetGame();
  
  font = loadFont("ArialUnicodeMS-48.vlw");
  textFont(font);
  
  cuore = loadShape("cuore.svg");
  
  size(1000,1000);
  
  noStroke();
  
   //Audio file loading 
   p = sketchPath(audioName);
  file = new SoundFile(this, p);
  
  gamemenu = new GameMenu();
  // level2=new Level_2();
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
 level2.score=0;
 level2.lives --; 
 level2.timer = new Timer(65);
 //level2.coinarray();  
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

}

//game menu first screen
void firstScreen() {
  gameScreen = 0; 
  bg.resize(1000,1000);
  background(bg);
  gamemenu.startMenu();
}
   
// third screen
void thirdScreen()
{
  gameScreen = 5; 
  bgGuide.resize(1000,1000);
  background(bgGuide); 
  draw_back();
  guidescreen.GuideText();
  guidescreen.GuideMenu();

}

// third screen
void fourthScreen()
{
gameScreen = 6; 
bgEnd.resize(1000,1000);
background(bgEnd);
//endscreen.EndText();
//endscreen.EndMenu();
}

void keyPressed()
{
  if (keyPressed){
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
      //resetGame();
      //loop();
      if(gameScreen==1 && (Level1.lives==0 || Level1.time==0))
      {
        
      resetGame();
      Level1.lives=3;
      Level1.score=0;
      Level1.timer.setTime(65);
      loop();
      redraw();
      }
      else if (gameScreen == 2)
      {//noLoop();
     level2=new Level_2();
     level2.lives=4;
      resetGame();
      redraw();
      }
  }
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
