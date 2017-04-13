
class Button {
  //data
  float x, y;
  float theWidth, theHeight;
  float fontSize;
  color backgroundColor, fontColor, hoverBackgroundColor, hoverFont;
  String label;
  boolean hasBeenClicked;

  //constructor(s)
  Button(float x_cor, float y_cor, float the_width, float the_height, String text) {
    x = x_cor;
    y = y_cor;
    theWidth = the_width;
    theHeight = the_height;
    backgroundColor = color(0);
    fontColor = color(255);
    hoverBackgroundColor = color(150);
    hoverFont = color(0);
    label = text;
    fontSize = theWidth*0.2;
    hasBeenClicked = false;
  }

  //behaviour
  void display() {
    if ( isMouseHovering() ) {
      focusedDisplay();
    } else {
      unfocusedDisplay();
    }
  }
  
  void checkForClick() {
    if (isMouseHovering()) {
      hasBeenClicked = true;
    }else {
      hasBeenClicked = false;
    }
  }

  boolean isClicked() {
    return hasBeenClicked;
  }

  boolean isMouseHovering() {
    if ( (mouseX > x - theWidth/2) && (mouseX < x + theWidth/2) &&
         (mouseY > y - theHeight/2) && (mouseY < y + theHeight/2)) {
      return true;
    } else {
      return false;
    }
  }

  void unfocusedDisplay() {
    rectMode(CENTER);
    fill(backgroundColor);
    rect(x, y, theWidth, theHeight);
    fill(fontColor);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }

  void focusedDisplay() {
    rectMode(CENTER);
    fill(hoverBackgroundColor);
    rect(x, y, theWidth, theHeight);
    fill(hoverFont);
    textSize(fontSize);
    textAlign(CENTER, CENTER);
    text(label, x, y);
  }
    
}