int player1Score;
int player2Score;
boolean multiPlayer;
boolean gameStarted;
boolean roundEnd;
TankTerrorRound round;
boolean roundStarted;
boolean[] keys = new boolean[200]; 
int numNPC;
boolean NPCSelection;

void setup(){
  gameStarted = false;
  size(1001, 1001);
  background(255);
  player1Score = 0;
  player2Score = 0;
  
  PImage tank = loadImage("tank.png");
  image(tank, 150, 75);
  
  //Select Mode button
  PImage mode = loadImage("mode.png");
  image(mode, 250, 475);
  
  //Single Player Button
  PImage one = loadImage("1player.png");
  image(one, 300, 600);
  
  //Two Player Button
  PImage two = loadImage("2player.png");
  image(two, 300, 725);
}

void mousePressed(){
  // Checks for multiplayer input and clears background to start round
  if (!gameStarted){
    if (mouseX >= 300 && mouseX <= 700 && mouseY <= 700 && mouseY >= 600){
      gameStarted = true;
      multiPlayer = false;
      npcSelection();
      NPCSelection = false;
    }
    if (mouseX >= 300 && mouseX <= 725 && mouseY <= 825 && mouseY >= 725){
      gameStarted = true;
      multiPlayer = true;
      npcSelection();
      NPCSelection = false;
    }
    roundEnd = true;
  }
  else if (!NPCSelection) {
      if (mouseX >= 275 && mouseX <= 375 && mouseY <= 745 && mouseY >= 625){
        numNPC = 1;
        print(1);
        gameStarted = true;
        background(183,233,246);
        NPCSelection = true;
      }
      if (mouseX >= 450 && mouseX <= 550 && mouseY <= 745 && mouseY >= 625){
        numNPC = 2;
        print(2);
        gameStarted = true;
        background(183,233,246);
        NPCSelection = true;
      }
      if (mouseX >= 625 && mouseX <= 725 && mouseY <= 745 && mouseY >= 625){
        numNPC = 3;
        print(3);
        gameStarted = true;
        background(183,233,246);
        NPCSelection = true;
      }
  }
}

void npcSelection() { 
  background(255);
  PImage tank = loadImage("tank.png");
  image(tank, 150, 75);
  PImage npc = loadImage("npc.png");
  image(npc, 375, 500);
  PImage npc1 = loadImage("1.png");
  image(npc1, 275, 625);
  PImage npc2 = loadImage("2.png");
  image(npc2, 450, 625);
  PImage npc3 = loadImage("3.png");
  image(npc3, 625, 628);
}
  
void keyPressed() {
    keys[keyCode] = true;
}

void keyReleased() {
    keys[keyCode] = false;
}

public void draw(){
  if (gameStarted && !roundStarted && NPCSelection) {
    startRound();    
  }
  if (gameStarted && NPCSelection) {
    background(183,233,246);
    round.advanceRound();
    if (!multiPlayer) {
      if (round.win() == 0) {
        gameStarted = false;
        roundEnd = true;
      }
      else if (round.win() == 1) {
        player1Score++;
        gameStarted = true; 
        roundStarted = false;
        roundEnd = true;
        displayScore();
      }
    }
    else {
      if (round.win() == 0) {
        gameStarted = false;
        roundEnd = true;
      }
      else if (round.win() == 1) {
        player1Score++;
        gameStarted = true; 
        roundStarted = false;
        roundEnd = true;
        displayScore();
      }
      else if (round.win() == 2) {
        player2Score++;
        gameStarted = true; 
        roundStarted = false;
        roundEnd = true;
        displayScore();
      }
    }
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
  delay(1000);
  if (multiPlayer){
    System.out.println("Player One Score: " + player1Score + " --- " + "Player Two Score: " + player2Score); 
  }
  else{
    System.out.println("Score: " + player1Score); 
  }
}

public void displayWin(){
  
}
