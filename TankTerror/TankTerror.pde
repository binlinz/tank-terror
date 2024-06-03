int player1Score;
int player2Score;
boolean multiPlayer;
boolean gameStarted;
boolean roundEnd;
TankTerrorRound round;
boolean roundStarted;
boolean[] keys = new boolean[128]; 

void setup(){
  gameStarted = false;
  size(1001, 1001);
  background(255);
  player1Score = 0;
  player2Score = 0;
  
  PImage tank = loadImage("tank.png");
  image(tank, 150, 75);
  //Select Mode button
  fill(0);
  textSize(60);
  text("Select Mode", 345, 530);
  
  //Single Player Button
  fill(100);
  rect(275, 575, 450, 125);
  fill(255);
  textSize(55);
  text("Single Player", 350, 655);
  
  //Two Player Button
  fill(100);
  rect(275, 725, 450, 125); 
  fill(255);
  textSize(55);
  text("Two Player", 375, 800);
  }
  
void mousePressed(){
  // Checks for multiplayer input and clears background to start round
  if (!gameStarted){
    if (mouseX >= 275 && mouseX <= 725 && mouseY <= 700 && mouseY >= 575){
      multiPlayer = false;
      gameStarted = true;
      background(80, 190, 250);
    }
    if (mouseX >= 275 && mouseX <= 725 && mouseY <= 850 && mouseY >= 725){
      multiPlayer = true;
      gameStarted = true;
      background(80, 190, 250);
    }
    roundEnd = true;
  }
}
  
void keyPressed() {
    keys[keyCode] = true;
}

void keyReleased() {
    keys[keyCode] = false;
}

public void draw(){
  if (gameStarted && !roundStarted) {
    startRound();    
  }
  if (gameStarted) {
  background(80, 190, 250);
    round.advanceRound();
  }
  if (!gameStarted && roundEnd) {
    displayScore();
    displayWin();
  }
}

public void startRound(){
  if (roundEnd){
    roundEnd = false;
    round = new TankTerrorRound(multiPlayer);
    round.generateMap();
  }
}

public void displayScore(){
  // REMEMBER TO ADD TEXT OR DOCUMENTATION SO PEOPLE KNOW WHO IS P1 AND P2 
  // THIS IS A PRIMITIVE PLACEHOLDER FOR AN ACTUALY SCORE BOARD
  if (multiPlayer){
    System.out.println("Player One Score: " + player1Score + " --- " + "Player Two Score: " + player2Score); 
  }
  else{
    System.out.println("Score: " + player1Score); 
  }
}

public void displayWin(){
  
}
