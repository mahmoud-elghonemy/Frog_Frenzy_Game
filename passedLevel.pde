class passedLevel extends rectangle{
  PImage win;
passedLevel(float x, float y, float w, float h)
{
  super(x,y,w,h);
  win=loadImage("win.gif");
  win.resize(600,300);
}
void win(int gameScreen){
     noLoop();
     background(#E84325);
     //fill(#E84325);
     //rect(0,0,200,200);
     image(win,200,200);
    // textSize(100); 
     fill(255);
     //text("YOU WIN",width/2-(textWidth("YOU WIN") / 2),550);
    textSize(50); 
    //text("score: "+ Level1.score,width/2-(textWidth("score: ") / 2),700);
    text("press spacepar to play next level",width/2-(textWidth("press spacepar to play next level") / 2),600);
    
    for (Coin coins : Level1.coin) {
            coins.x=-100;
            coins.y=-100;
           }
           
    gameScreen++;
    if(keyCode== ' '){
      //loop();
      if( gameScreen==2)
      {
      //noLoop();
     level2=new Level_2();
     level2.lives=4;
      resetGame();
      //loop();
      redraw();
  }
    }
  }

  }
