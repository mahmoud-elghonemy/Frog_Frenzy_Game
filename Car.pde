class Car extends rectangle 
{  float speed;
   int indx;
   PImage Icar=loadImage("data/images/car1.png");
   PImage car1;
   PImage log;
   PShape red=loadShape("data/images/car9.svg");
   PShape blue=loadShape("data/images/car10.svg");
  
  Car(float x,float y,float w,float h,float speed,int indx)
  {
  super(x,y,w,h);
  this.speed = speed;
  this.indx=indx;
   //loading images
     car1 = loadImage("data/images/car1.png");
     car1.resize((int)w, (int)h);
     log = loadImage("data/images/log.png");
     log.resize((int)w, (int)h);
  }
  
  // muv car
  void ShowCar(char k)
  {
    if(k =='R')
    {
      shape(red,this.x,this.y,this.w,this.h);
    }
    else if (k == 'B')
    {
      image(car1,this.x,this.y,this.w,this.h);
    }
    else if (k=='l'){
    image(log,this.x,this.y,this.w,this.h);
    }
    else
    {
   image(car1, x, y);
    }
  
  } 
   void update()
  {
    this.x+=speed;
    if(speed >0) //positive go to right
    { 
      if(this.x > width)
      {
        this.x=-speed; 
      }
    }
    else if (speed <0) //go t0 left
    {
      if(this.x+this.w <0)
      {
        this.x =  width;
      }
    }
   
  
  } 
}
