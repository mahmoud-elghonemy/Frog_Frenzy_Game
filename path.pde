class path extends rectangle{
   PImage ww=loadImage("data/images/log.png");
   path(float x, float y, float w, float h){
   super(x,y,w,h);
  }
 void show(){
 fill(0,204,0);
 image(ww,this.x,this.y,this.w,this.w);
 }//end show
}//end class
