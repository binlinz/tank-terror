int player1Score;
int player2Score;
boolean multiPlayer;
boolean gameStarted;
boolean roundEnd;

void setup(){
  roundEnd = true;
  size(1000, 1000);
  background(80, 190, 250);
  player1Score = 0;
  player2Score = 0;
  //Select Mode button
  fill(100);
  rect(250, 75, 500, 150);
  fill(0);
  textSize(60);
  text("Select Mode", 345, 160);
  
  //Single Player Button
  fill(100);
  rect(250, 375, 500, 150);
  fill(0);
  textSize(60);
  text("Single Player", 335, 475);
  
  //Two Player Button
  fill(100);
  rect(250, 675, 500, 150); 
  fill(0);
  textSize(60);
  text("Two Player", 350, 775);
  }
  
void mousePressed(){
  // Checks for multiplayer input and clears background to start round
  if (!gameStarted){
    if (mouseX >= 250 && mouseX <= 750 && mouseY <= 525 && mouseY >= 375){
      multiPlayer = false;
      gameStarted = true;
      background(80, 190, 250);
    }
    if (mouseX >= 250 && mouseX <= 750 && mouseY <= 825 && mouseY >= 675){
      multiPlayer = true;
      gameStarted = true;
      background(80, 190, 250);
    }
  }
}
  
public void draw(){
  startRound();
  displayScore();
  displayWin();
}

public void startRound(){
  if (roundEnd){
    roundEnd = false;
    TankTerrorRound round = new TankTerrorRound(multiPlayer);
    round.generateMap();
    round.advanceRound();
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
