class Cups{
  int amountOfCups, level,apple,state,lifeLeft, score0,ballx,bally;
  float speed;
  IntList numbersOfCups;
  PImage cup1,ball;
  String time, life, levels, score;
  Button start;
  Boolean rotate;
  
  
  Cups(){
    speed = 1.0;
    amountOfCups = 3;
    level=1;
    cup1 = loadImage("totoro_by_brumoretti-d8cwtui.png");
    cup1.resize(150,250);
    state = 1;
    numbersOfCups = new IntList();
    numbersOfCups.append(width/2-200);
    numbersOfCups.append(width/2);
    numbersOfCups.append(width/2 +200);
    start = new Button(width/2, height*0.2 , width/10, height/10, "start");
    life = "Life";
    lifeLeft = 3;
    score = "Score";
    score0 = 0;
    rotate = false;
    ball = loadImage("yarn.png");
    ballx = width/2;
    bally = 490;
    ball.resize(70,55);
    
  }
  
  void display(){
    if (state==0){
      //starting window
      for(int i = 0; i<3;i++){
        starting();
      }
    }else if(state == 1){
      //level1, rotate
      rotateCup();
    }else if (state == 2 ){
      //level2,rotate
    }else if (state == 3 ){
      //level3,rotate
      
    }
    if (state<4){
      //button,time
      if (rotate==false){
        start.fontSize =start.theWidth*0.4; 
        start.hoverBackgroundColor= color(0);
        start.backgroundColor=color(#C1B27B);
        start.hoverFont=color(255);
        start.display();
      }
      
      String lifeNow = life+":" + lifeLeft;
      textAlign(LEFT,TOP);
      text(lifeNow, width*0.2,height*0.2); 
      
      String scoreNow = score+":"+score0;
      text(scoreNow, width*0.7,height*0.2);
    }
    
  
  }
  
  void starting(){
    image(ball,ballx,bally);
    for(int i = 0; i<3;i++){   
        imageMode(CENTER);
        image(cup1, numbersOfCups.get(i),400);
      }
    
  }
  void wrong(){
    //guess the wrong one will reduce player's life
    
  }
  
  
  void rotateCup(){
    //
    selectPoints();
    if(state ==1){
      for(int i = 0; i<10; i++){
        
        if(millis()>i*2000){
          
        }
      }
    }
  }
  
  void selectPoints(){
    //to select points to switch he place of the cup
    IntList newCordinate;
    newCordinate=new IntList();
    newCordinate.append(numbersOfCups.get(0));
    newCordinate.append(numbersOfCups.get(1));
    newCordinate.append(numbersOfCups.get(2));
    
    
    for (int i = 0; i<=state*9; i++){
      int ballInIt = numbersOfCups.get(1);
      newCordinate.remove(1); 
      int ballGoesInItPre=int(random(1.1));
      int ballGoesInIt = newCordinate.get(ballGoesInItPre);
      newCordinate.remove(ballGoesInItPre);
      newCordinate.append(ballInIt);
      newCordinate.append(ballGoesInIt);
      newCordinate.reverse();
      
      numbersOfCups.set(0,newCordinate.get(0));
      numbersOfCups.set(1,newCordinate.get(1));
      numbersOfCups.set(2,newCordinate.get(2));
      println(numbersOfCups);
    }
    
  }
  
  void handleButton(){
    if(rotate == false){
      start.checkForClick();
      if(start.hasBeenClicked){
        rotate = true;
      }
    }
    
  }
}