class gameOver extends rectangle{
  PImage loss;
gameOver(float x, float y, float w, float h)
{
  super(x,y,w,h);
  loss=loadImage("lossfrog.jpeg");
  loss.resize(600,300);
}
void endgame(){
  //noLoop();
     background(70,55,113,300);
     image(loss,200,150);
     textSize(100); 
     text("GAME OVER",width/2-textWidth("GAME OVER")/2,550);
     textSize(50); 
     text("press spacepar to play again",width/2-textWidth("press spacepar to play again")/2,650);
     
   if(keyCode== ' '){
      gameScreen=1;
      resetGame();
      Level1.lives=4;
      Level1.score=0;
      Level1.timer.setTime(65);
      //loop();
      redraw();
  }
  }
  }
