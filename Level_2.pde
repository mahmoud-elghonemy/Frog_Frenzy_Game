class Level_2 {
    float grid = 100;
    Car cars[];
   // PImage Icar[];
    float arrRnd[][]=new float[2][5];
    
    rectangle rect1=new rectangle(0 ,height-1.25*grid ,width,1.25*grid);
    rectangle rect2=new rectangle(0 ,height-3*1.25*grid ,width,2*1.25*grid);
    rectangle rect3=new rectangle(0 ,height-4*1.25*grid ,width,1.25*grid);
    rectangle rect4=new rectangle(0 ,height-7*1.25*grid ,width,3*1.25*grid);
    rectangle rect5=new rectangle(0 ,0,width,1.25*grid);
    rectangle rectFinal=new rectangle(0 ,0,width,1.25*grid);
    PImage IRec2=loadImage("data/images/road.jpg");
    PImage IRec3=loadImage("data/images/gross.jpg");
   
  PShape Icar[]= new PShape[5];
  Level_2()
  { 
    cars = new Car[5];
    //Icar =new PImage[5];

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
                
             }else {
               break;
             }
         }
         
         if(!bb)
         {
           shape(Icar[i],cars[i].x,cars[i].y,cars[i].w,cars[i].h);
         }
         bb=true;
        
         
         
        }
     
        
   }









}
