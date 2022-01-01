class GameMenu {
  Level_2 level_2=new Level_2();
  level1 Level1=new level1();
  boolean Menu = true, Play;
  float Button1 = 50, Button2 = 50, Button3 = 50 ,Button4=100 ; //opacity
  
  void startMenu() {  
    //Button 1: 
    fill(210, 44, 44,Button1+150); //Button margin colour
    rect(800, 775, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Play", 800 - (textWidth("Play") / 2),850 + ((textAscent() - textDescent()) / 2) - 75);
    
    
    //Button 2: 
    fill(210, 44, 44,Button2+150); //Button margin colour
    rect(800,850, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Guide", 800 - (textWidth("Guide") / 2), 850 + ((textAscent() - textDescent()) / 2));
    
    
    //Button 3:
    fill(210, 44, 44,Button3+150); //Button margin colour
    rect(800, 925, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Quit", 800 - (textWidth("Quit") / 2), 850 + ((textAscent() - textDescent()) / 2) + 75);
    
    
   
    
    if (Menu) {
      if (mouseX > 800 - 100 && mouseX < 800 + 100 
      && mouseY > 775 - 75 - 25 && mouseY < 900 - 75 ) { //pointer collision with Button1
        if (mousePressed) {
          file.play();
          file.loop();
          gameScreen=1;
          resetGame();
          
        }
        if (Button1 < 150) { //Highlighting effect by darkening the colour for button 1
          Button1 += 200;
        }
      } 
      else if (Button1 > 100) { //out back to first color
        Button1 -= 100;
      }

      if (mouseX > 800 - 100 && mouseX < 800 + 100 
      && mouseY > 850 - 25 && mouseY < 850 + 25) { //pointer collision with Button2
        if (mousePressed) { 
          //Call guide window over here
          thirdScreen();
        }
        if (Button2 < 150) { //Highlighting effect by darkening the colour for button 2
          Button2 += 200;
        }
      } else if (Button2 > 100) {
        Button2 -= 100;
      }

      if (mouseX > 800 - 100 && mouseX < 800 + 100 
      && mouseY > 850 + 75 - 25 && mouseY < 850 + 75 + 25) { //pointer collision with Button3
        if (mousePressed) {
          exit();  //Quits the window
          
        }
        if (Button3 < 150) { //Highlighting effect by darkening the colour for button 3
          Button3 += 200;
        }
      } else if (Button3 > 100) {
        Button3 -= 100;
      }
    }
  }
}
