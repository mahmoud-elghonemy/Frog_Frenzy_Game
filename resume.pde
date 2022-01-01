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
  
  fill(255);
  textSize(40); 
  text("if you want to continue   ",this.x-textWidth("if you want to continue ")/2,this.y+100+20-((textAscent() - textDescent()) / 2));
  text("playing press space",this.x-textWidth(" playing press space")/2,this.y+100+80-((textAscent() - textDescent()) / 2));
  fill(210, 44, 44); //Button margin colour
  rect(this.x, this.y-100, 200, 50, 20); //Drawing the button
  fill(0);
  textSize(30); 
  text("home",this.x-textWidth("home")/2,this.y-100+20-((textAscent() - textDescent()) / 2));
  
  fill(210, 44, 44); //Button margin colour
  rect(this.x, this.y, 200, 50, 20); //Drawing the button
  fill(0);
  textSize(30); 
  text("exit",this.x-textWidth("exit")/2,this.y+20-((textAscent() - textDescent()) / 2));
  
if (mouseX > this.x-100 && mouseX < this.x +100 
      && mouseY > this.y-150 && mouseY < this.y-100) { //pointer collision with Button2
        if (mousePressed) { 
          firstScreen();
        }
        fill(210, 44, 44,100); //Button margin colour
        rect(this.x, this.y-100, 200, 50, 20); //Drawing the button
      }
      
if (mouseX > this.x-100 && mouseX < this.x +100 
      && mouseY > this.y-50 && mouseY < this.y) { //pointer collision with Button2
        if (mousePressed) { 
          exit();
        }
         
        fill(210, 44, 44,100); //Button margin colour
        rect(this.x, this.y-100, 200, 50, 20); //Drawing the button
      }
}
}
