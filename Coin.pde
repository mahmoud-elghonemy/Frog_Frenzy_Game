class Coin extends rectangle{
 int picW = 839;
  int picH = 187;
  PImage coins;
  PImage []coin; 
  int imgLength;
  int i;
  PImage coinn; // rotate coin 
  PShape image;
 float angle = 0.02;

Coin(float x, float y, float w){

super(x,y,w,w);
    
   
    image = loadShape("gold.svg");
   
}

 void showCoin() {
   
    pushMatrix();
    translate(this.x,this.y);
   rotate(angle);
   shape(image, -0.5*this.w,-0.5*this.w,this.w,this.w);
   angle += 0.09;
    popMatrix();
    
  
  }
}
