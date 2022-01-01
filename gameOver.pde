/*class gameOver extends rectangle{
  PImage loss;
gameOver(float x, float y, float w, float h)
{
  super(x,y,w,h);
  loss=loadImage("lossfrog.jpeg");
  loss.resize(600,300);
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
      Level1.lives=4;
     }
     
     else if (gameScreen==2)
     {
      gameScreen=2;
      level2.lives=4;
     }
     else if (gameScreen==3)
     {
      gameScreen=3;
      level3.lives=4;
     }
    // gameScreen=4;
     resetGame();
      redraw();
  }
  }
  }*/
