class Coin extends rectangle{
 int picW = 839;
  int picH = 187;
  PImage coins;
  PImage []coin; 
  int imgLength;
  int i;
  PImage coinn; // rotate coin 
  //float angle=0.1;
PShape image;
 float angle = 0.02;

Coin(float x, float y, float w){

super(x,y,w,w);
    //i=0;
    //imageMode(CENTER);
    image = loadShape("gold.svg");
    //coinn = loadImage("data/coins.jpeg");
    //imgLength = 4;
    
   // coin = new PImage[imgLength];
    
    //Loading images for coin
   // coins = loadImage("data/coin.png");
    //cropping the image 
   /* for(int i=0; i<coin.length; i++){
      coin[i] = coins.get(i*picW/imgLength, 0, picW/imgLength, picH);
      coin[i].resize(60, 60);
    }*/
}

 void showCoin() {
    //image(coin[i], x, y);
    pushMatrix();
    translate(this.x,this.y);
   rotate(angle);
   shape(image, -0.5*this.w,-0.5*this.w,this.w,this.w);
   angle += 0.02;
    popMatrix();
    
    /*
    //make the animation goes slower
   if((frameCount)%5==0){
      i++;
      if (i==coin.length){
        i=0;
      }
    }  */
  }
}
