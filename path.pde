class path extends rectangle{
   PImage ww=loadImage("data/1.jpg");

   path(float x, float y, float w, float h){
  
   super(x,y,w,h);

  }
   
 void show(){
 
 fill(0,204,0);
 image(ww,this.x,this.y,this.w,this.w);
 //rect(x, y, w, h);
 
 }
}
