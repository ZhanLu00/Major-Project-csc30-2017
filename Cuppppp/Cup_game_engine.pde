class Cup_game_engine{
  Boolean game;
  int window_width, window_height;
  Cups cup;
  Menu aMenu;
  
  Cup_game_engine(){
    aMenu = new Menu();
    game = false;
    cup= new Cups();
    
  }
  
  void display(){
    aMenu.display();
    if(aMenu.state==3){
      game = true;
      cup.display();
    }
  }
  
  void handleKeyPressed(){
    if(game){
      
    }else {
      aMenu.handleKeyPressed();
      println(aMenu.state);
    }
  }
  
  void handleMouseClicked(){
    if(game){
      
    }else{
      aMenu.handleMouseClicked();
      println(aMenu.state);
    }
  }
}