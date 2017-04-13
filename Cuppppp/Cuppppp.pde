Cup_game_engine game;


void setup(){
  size(800,600);
  game = new Cup_game_engine();
}

void draw(){
  game.display();
}

void keyPressed(){
  game.handleKeyPressed();
}

void mouseClicked(){
  game.handleMouseClicked();
}