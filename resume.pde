class resume extends rectangle {
float exit =50, resum=100 ,home=50 ; //x = 100 , y=100 , width=800,height=500
resume(float x, float y, float w, float h)
{ 
  super(x,y,w,h);
}
void show_resume()
{
  
  fill(0,0,0,200);
  rect(this.x,this.y,this.w,this.h,20);
  //resume resume=new resume(140,140,400,400);
  fill(255);
  textSize(30); 
  text("if you want to continue ",this.x+textWidth("if you want to continue ")/2-90,380+((textAscent() - textDescent()) / 2));
  text("playing press space",this.x+textWidth("playing press space")/2-65,420+((textAscent() - textDescent()) / 2));
  
  fill(210, 44, 44); //Button margin colour
  //fill(210, 44, 44,home+150);
  rect(this.x+100,this.y+80,180,50,20); //Drawing the button //x=240 y=220
  
  fill(0);
  //textSize(30); 
  text("home",this.x+190-textWidth("home")/2,this.y+110+((textAscent() - textDescent()) / 2));
  
  fill(210, 44, 44); //Button margin colour
  rect(this.x+100, this.y+160, 180, 50, 20); //Drawing the button //x=240 y=300 w=180 h=50
 
  fill(0);
  textSize(30); 
  text("exit",this.x+190-textWidth("exit")/2,this.y+200-((textAscent() - textDescent()) / 2));
  //x=240 y=220 w=180 h=50
if (mouseX > 240 && mouseX <  420 
      && mouseY > 220 && mouseY < 270) { //pointer collision with Button2
        if (mousePressed) { 
          firstScreen();
        }
        
        fill(210, 44, 44,100); //Button margin colour
       rect(this.x+100,this.y+80,180,50,20); //Drawing the button
       
      }
      //x=240 y=300 w=180 h=50
if (mouseX > 240 && mouseX < 240+180 
      && mouseY > 300 && mouseY < 350) { //pointer collision with Button2
        if (mousePressed) { 
          exit();
        }
         
        fill(210, 44, 44,100); //Button margin colour
        rect(this.x+100, this.y+160, 180, 50, 20); //Drawing the button
      }
}
}
