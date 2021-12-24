class Coin extends rectangle{
 int picW = 839;
  int picH = 187;
  PImage coins;
  PImage []coin; 
  int imgLength;
  int i;


Coin(float x, float y, float w){

super(x,y,w,w);
    i=0;
    imgLength = 4;
    
    coin = new PImage[imgLength];
    
    //Loading images for coin
    coins = loadImage("data/coin.png");
    //cropping the image 
    for(int i=0; i<coin.length; i++){
      coin[i] = coins.get(i*picW/imgLength, 0, picW/imgLength, picH);
      coin[i].resize(60, 60);
    }
}

 void showCoin() {
    image(coin[i], x, y);
    
    //make the animation goes slower
   if((frameCount)%5==0){
      i++;
      if (i==coin.length){
        i=0;
      }
    }  
  }
}
