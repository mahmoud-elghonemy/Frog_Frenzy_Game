class Coin extends rectangle{

 
  PShape image;
  float angle = 0.02; //angle uses rotate conin

Coin(float x, float y, float w){

     super(x,y,w,w);
    
    image = loadShape("data/images/gold.svg");
   
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
