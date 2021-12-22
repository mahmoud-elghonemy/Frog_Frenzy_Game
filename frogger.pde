Frog frog;
path paths[];
float grid = 100;
   
  rectangle rect,rect2,rect3,rect4;
//  frog = new Frog(0.25*grid, height-0.75*grid, 0.75*grid);
void resetGame() {
  frog.x=0.25*grid;
  frog.y=height-0.75*grid;
  frog.showUp();
  
  frog.showUp();
}
void setup(){
  frog = new Frog(0.25*grid, height-0.75*grid, 0.75*grid);
  size(1000,1000 ,P3D);
  resetGame();
  noStroke();
  //path
rect=new rectangle(1.25*grid,height-(1.25*grid),width-1.25*grid,1.25*grid);
rect2=new rectangle(0,height-3*1.25*grid,width-1.25*grid,1.25*grid);
rect3=new rectangle(1.25*grid,height-5*1.25*grid,width-1.25*grid,1.25*grid);
rect4=new rectangle(0,height-7*1.25*grid,width-1.25*grid,1.25*grid);

  paths =  new path[36];
  
  //row1
  
  int index=0;
   for (int i = 0; i < 2; i++) {
    float x =0;
    float y= height-1.25*grid-1.25*i*grid;
    paths[index] = new path(x, y, 1.25*grid, 1.25*grid);
    index++;
  }
 
  //row2
   
  
  for (int i = 0; i < 7; i++) {
   float x = 1.25*grid+i*1.25*grid;
   float y= height-2*1.25*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  
  //row3
   for (int i = 0; i < 2; i++) {
    float x = width-1.25*grid;
  float y= height-3*1.25*grid-1.25*i*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
    index++;
  }
  
  //row4
   for (int i = 0; i < 7; i++) {
   float x = width-2*1.25*grid-i*grid*1.25;
   float y= height-4*1.25*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  
  //row5
   for (int i = 0; i < 2; i++) {
    float x = 0;
    float y= height-5*1.25*grid-i*grid*1.25;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
    index++;
  }
  
  //row6
   for (int i = 0; i < 7; i++) {
   float x = 1.25*grid+i*1.25*grid;
   float y= height-6*1.25*grid;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  //row7
    for (int i = 0; i < 2; i++) {
    float x = width-1.25*grid;
    float y= height-7*1.25*grid-i*grid*1.25;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
    index++;
  }
  //row8
   for (int i = 0; i < 7; i++) {
   float x =i*grid*1.25;
   float y= 0;
    paths[index] = new path(x, y, grid*1.25, grid*1.25);
   index++;
  }
  
}


void draw(){
  background(255);
  rect.DrawRec();
  rect2.DrawRec();
  rect3.DrawRec();
  rect4.DrawRec();
  for (path pat : paths) {
    pat.show();
   /* if ((frog.intersect(pat))) {
      resetGame();
   }*/
   if(frog.intersect(rect) || frog.intersect(rect2) || frog.intersect(rect3) || frog.intersect(rect4))
   {
        resetGame();
    }
 
  //frog
  if (keyCode == UP){
    frog.showUp();
   }
  else if (keyCode == LEFT){
    frog.showLeft();
  }
  else if (keyCode == DOWN){
    frog.showDown();
  }
  else if (keyCode == RIGHT){
    frog.showRight();
  }else{
    frog.showUp();
  }

  
}
}


void keyPressed()
{
  if (keyPressed){
    if (keyCode == UP  && frog.y>0 ){
      frog.move(0,-1);
    }
    else if (keyCode == LEFT &&  frog.x>0){
      frog.move(-1,0);
    }
    else if (keyCode == DOWN && frog.y+frog.h<height){
      frog.move(0,1);
    }
    else if (keyCode == RIGHT && frog.x+frog.w<width){
      frog.move(1,0);
    }
  }
}
 
