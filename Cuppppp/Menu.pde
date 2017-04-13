class Menu {
  float buttonWidth, buttonHeight;
  int state;
  String title;
  PImage background, gameOver;
  Button start, help, back;

  Menu() {
    state=0;
    buttonWidth =width*0.3;
    buttonHeight = height*0.1;
    start = new Button(width/2, height*0.4, buttonWidth, buttonHeight, "Start" );
    help = new Button(width/2, height*0.6, buttonWidth, buttonHeight, "Help");
    back = new Button(width*0.8, height*0.07, width*0.1, height*0.02, "Back" );
    title = "Cups Game";
    background = loadImage("totoro_01_by_erpete.jpg");
    background.resize(width, height);
  }

  void display() {
    if (state==0) {
      //starting background
      image(background, 0, 0);
      textAlign(CENTER);
      textSize(50);
      text(title, width/2, height/2);
      
    } else if (state==1) {
      //options:how to play&begin
      background(#79B5F0);
      start.display();
      help.display();
      
    } else if (state==3) {
      //game background
      state3();
      
    } else if (state == 4) {
      state4();
      
    } else if (state == 5) {
      //game over
    }
  }
  
  void state3(){
    background(#E8DBA9);
    
  }
  
  void state4(){
    background(0);
    back.display();
  }
  
  void handleKeyPressed() {
    //when pressed space, state changes
    if (keyPressed &&key == ' ') {
      if (state==0) {
        //changes to menu
        state +=1;
      } else if (state == 5) {
        //change to game
        state = 1;
      }
    }
  }

  void handleMouseClicked() {
    if (state == 1) {
      start.checkForClick();
      help.checkForClick();
      if (start.hasBeenClicked) {
        state = 3;
      } else if (help.hasBeenClicked) {
        state = 4;
      }
    } else if (state==4) {
      back.checkForClick();
      if (back.hasBeenClicked) {
        state = 1;
      }
    }
  }
  
  
}