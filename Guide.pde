class GuideScreen {
  level1 Level1=new level1();
  boolean MenuGuide = true, Play;
  float B1 = 100, B2 = 100;
  
  void GuideText() {
    textSize(36);
     text("Guide:", (width /2) - (textWidth("Guide:") / 2), 58);  
    
    textSize(28);
    text("Control the Frog with 4 Arrows Keys", (width /2) - 
    (textWidth("Control the Frog with 4 Arrows Keys") / 1.9), 110);  
    
    textSize(20);
    text("Your goal is to guide the frog to safety lane from \nthe bottom of the screen to the safety lane on the top", (width /2) - 
    (textWidth("Your goal is to guide the frog to safety lane from \nthe bottom of the screen to the safety lane on the top")
    / 2), 150);  
    
    textSize(28);
    text("Good Luck!", (width /2) - (textWidth("Good Luck!") / 2), 220);  
  }
  
  void GuideMenu() {  
    //Button 1: 
    fill(0, 0, 0, B1); //Button margin colour
    rect(width/2, height/2 + 280, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Play", (width /2) - (textWidth("Play") / 2), (height/2) + ((textAscent() - textDescent()) / 2) + 280);
    
    //Button 2:
    fill(0, 0, 0, B2); //Button margin colour
    rect(width/2, height/2+300 + 75, 200, 50, 20); //Drawing the button
    fill(255); //Font colour for inside of the button
    //Button text
    text("Quit", (width /2) - (textWidth("Quit") / 2), (height/2) + ((textAscent() - textDescent()) / 2) + 375);
    
    
    if (MenuGuide) {
      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 + 280 - 25 && mouseY < height/2 +280 + 25) { //pointer collision with Button1
        if (mousePressed) { 
          file.play();
          file.loop();
          gameScreen=1;
          resetGame();
        }
        if (B1 < 150) { //Highlighting effect by darkening the colour for button 1
          B1 += 100;
        }
      } else if (B1 > 100) {
        B1 -= 100;
      }

      if (mouseX > width/2 - 100 && mouseX < width/2 + 100 
      && mouseY > height/2 + 375 - 25 && mouseY < height/2 + 375 + 25) { //pointer collision with Button3
        if (mousePressed) {
          exit();  //Quits the window
          
        }
        if (B2 < 150) { //Highlighting effect by darkening the colour for button 3
          B2 += 100;
        }
      } else if (B2 > 100) {
        B2 -= 100;
      }
    }
  }
}
