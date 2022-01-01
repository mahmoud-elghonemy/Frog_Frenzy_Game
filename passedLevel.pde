/*class passedLevel extends rectangle{
  PImage win;
passedLevel(float x, float y, float w, float h)
{
  super(x,y,w,h);
  win=loadImage("win.gif");
  win.resize(600,300);
}
void win(int gameScreen){
    // noLoop();
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
    if(gameScreen ==1)
    {
      Level1.frog.x=-100;
    for (Coin coins : Level1.coin) {
            coins.x=-100;
            coins.y=-100;
           }
          // gameScreen++;
    }
    else if(gameScreen ==2)
    {
      level2.frog.x=-100;
      for (Coin coins : level2.coin) {
            coins.x=-100;
            coins.y=-100;
           }
         //  gameScreen++;
    }
     else if(gameScreen ==3)
     {
       level3.frog.x=-100;
       gameScreen=6;
       
     }
    // resetGame();
     //loop();
      // redraw();
  }

  }
  */
