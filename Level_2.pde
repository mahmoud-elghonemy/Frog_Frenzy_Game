class Level_2 {
int score=0;
Frog frog;
path paths[];
Coin coin[];
int lives=4;
Timer timer; 
float grid = 100;
Car cars[];
rectangle rect1,rect2,rect3,rect4,rect5,rectFinal;
PImage IRec2,IRec3;
float arrRnd[][]=new float [2][5];
  PShape Icar[]= new PShape[5];;
  Level_2()
  { 
     rect1=new rectangle(0 ,height-1.25*grid ,width,1.25*grid);
     rect2=new rectangle(0 ,height-3*1.25*grid ,width,2*1.25*grid);
     rect3=new rectangle(0 ,height-4*1.25*grid ,width,1.25*grid);
     rect4=new rectangle(0 ,height-7*1.25*grid ,width,3*1.25*grid);
     rect5=new rectangle(0 ,0,width,1.25*grid);
     rectFinal=new rectangle(0 ,0,width,1.25*grid);
     IRec2=loadImage("data/images/road.jpg");
     IRec3=loadImage("data/images/green2.jpg");
    score=0;
    timer = new Timer(65);
    frog = new Frog(0.25*grid, height-0.75*grid, 0.75*grid);
    paths =  new path[36];
    coin = new Coin[16];
    cars = new Car[5];
   for(int i=0;i<5;i++)
   {
     arrRnd[0][i]=random(0,width);
     arrRnd[1][i]=random(rect2.y,rect2.y+rect2.h-50);
    }
      Icar[0]=loadShape("data/images/car9.svg");
      Icar[1]=loadShape("data/images/car10.svg");
      Icar[2]=loadShape("data/images/car9.svg");
      Icar[3]=loadShape("data/images/car10.svg");
      Icar[4]=loadShape("data/images/car9.svg");
  }
   void Drawlevel2()
   {  
     //back ground
      image(IRec2,rect2.x,rect2.y,rect2.w,rect2.h);
      image(IRec2,rect4.x,rect4.y,rect4.w,rect4.h);
      image(IRec3,rect1.x,rect1.y,rect1.w,rect1.h);
      image(IRec3,rect3.x,rect3.y,rect3.w,rect3.h);
      image(IRec3,rect5.x,rect5.y,rect5.w,rect5.h);
       
       //cars in row road one 
       cars[0]=new Car(arrRnd[0][0],arrRnd[1][0],150,75,0);
       
       boolean bb=true;
       for(int i=1;i<5;i++)
       {   
         cars[i]=new Car(arrRnd[0][i],arrRnd[1][i],150,75,0);
         for(int j=0;j<=i;j++)
         {
             if(!(cars[i].intersect(cars[j])) && bb==true)
             {  bb=false;
                
             }
             else {
               break;
             }
         }
         if(!bb)
         {
           shape(Icar[i],cars[i].x,cars[i].y,cars[i].w,cars[i].h);
         }
         bb=true;
        }    
   }//end draw
   
   
   }//end class
