class GameMenu {
  boolean Menu = true, Play;
  float Button1 = 100, Button2 = 100, Button3 = 100 ,Button4=100 ; //opacity

  void startMenu() {  
    //Button 1: 
    fill(255, 77, 80, Button1); //Button margin colour
    rect(width/2, height/2 - 75, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Play", (width /2) - (textWidth("Play") / 2), (height/2) + ((textAscent() - textDescent()) / 2) - 75);
    
    
    //Button 2: 
    fill(255, 77, 80, Button2); //Button margin colour
    rect(width/2, height/2, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Guide", (width /2) - (textWidth("Guide") / 2), (height/2) + ((textAscent() - textDescent()) / 2));
    
    
    //Button 3:
    fill(255, 77, 80, Button3); //Button margin colour
    rect(width/2, height/2 + 75, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Quit", (width /2) - (textWidth("Quit") / 2), (height/2) + ((textAscent() - textDescent()) / 2) + 75);
    
    
    //rect(width/2, height/2 + 75, 200, 50, 20); //Drawing the button
    //fill(255); //Font colour for inside of the button
    
    if (Menu) {
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 - 75 - 25 && mouseY < height/2 - 75 + 25) { //pointer collision with Button1
        if (mousePressed) {  
          secondScreen();
          //fill(255, 77, 80, Button4); //Button margin colour
          //draw_back();
          //TimerDisplay();
          resetGame();
        }
        if (Button1 < 150) { //Highlighting effect by darkening the colour for button 1
          Button1 += 100;
        }
      } 
      else if (Button1 > 100) { //out back to first color
        Button1 -= 100;
      }

      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 - 25 && mouseY < height/2 + 25) { //pointer collision with Button2
        if (mousePressed) { 
          //Call guide window over here
          thirdScreen();
        }
        if (Button2 < 150) { //Highlighting effect by darkening the colour for button 2
          Button2 += 100;
        }
      } else if (Button2 > 100) {
        Button2 -= 100;
      }

      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 + 75 - 25 && mouseY < height/2 + 75 + 25) { //pointer collision with Button3
        if (mousePressed) {
          exit();  //Quits the window
          
        }
        if (Button3 < 150) { //Highlighting effect by darkening the colour for button 3
          Button3 += 100;
        }
      } else if (Button3 > 100) {
        Button3 -= 100;
      }
    }
  }
}
