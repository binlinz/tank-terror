public class TankTerrorRound {
  public ArrayList<Tank> tanks;
  public ArrayList<NPCTank> NPCs;
  public ArrayList<PlayerTank> players;
  public Maze map;
  public ArrayList<Bullet> bullets;
  public ArrayList<PowerUp> powerUps; // turn into public
  //private int powerUpTimer;
  private boolean multiplayer;
  private int timeCreated;
  
  public TankTerrorRound(boolean multiplayer) {
    this.multiplayer = multiplayer;
    tanks = new ArrayList<Tank>();
    NPCs = new ArrayList<NPCTank>();
    players = new ArrayList<PlayerTank>();
    bullets = new ArrayList<Bullet>();
    powerUps = new ArrayList<PowerUp>();
  }
  
  public void generateMap() {
    map = new Maze(8, 8, 125);
    while (map.countWalls() < 70){
      map = new Maze(8, 8, 125);
    }
    map.makeMaze();
    PlayerTank player1 = new PlayerTank(1);
    tanks.add(player1);
    players.add(player1);
    if (multiplayer) {
      PlayerTank player2 = new PlayerTank(2);
      tanks.add(player2);
      players.add(player2);
    }
    for (int i = 0; i < numNPC; i++) {
      NPCs.add(new NPCTank(3));
    }
    map = new Maze(8, 8, 125);
    while (map.countWalls() < 90){
      map = new Maze(8, 8, 125);
    }
    map.makeMaze();
    timeCreated = millis() + 4000;
  }
  
  public void advanceRound() {
    int currentTime = millis();
    int timeElapsed = currentTime - timeCreated;
    if (timeElapsed >= 8000) {
      powerUps.add(new PowerUp());
      timeCreated = millis();
    }
    for (int j = 0; j < map.mazeRows; j++) {
      for (int i = 0; i < map.mazeCols; i++) {
        map.map[j][i].makeUnits();
      }
    }
    
    for (int i = 0; i < players.size(); i++){
      PlayerTank tank = players.get(i);
      tank.updateX();
      tank.updateY();
    }
    
    for (int i = 0; i < tanks.size(); i++) {
      Tank tank = tanks.get(i);
      tank.display();
      tank.move();
      tank.attack();
    }
    
    for (int i = 0; i < NPCs.size(); i++){
      NPCTank npc = NPCs.get(i);
      npc.display();
      npc.nearestTank(players.get(0));
      if (multiplayer){
        npc.nearestTank(players.get(1));
      }
      npc.move();
      npc.attack();
    }
    
    for (int i = 0; i < bullets.size(); i++) {
      Bullet bullet = bullets.get(i);
      if (bullet.isActive()) {
        bullet.display();
        bullet.advance();
        bullet.bounce();
        
        for (int j = NPCs.size() - 1; j >= 0; j--) {
          Tank npc = NPCs.get(j);
        if (bullet.destroyed(npc)){
          NPCs.remove(j);
          bullets.remove(i);
          break;
        }

        }
      for (int j = tanks.size() - 1; j >= 0; j--) {
        Tank tank = tanks.get(j);
        if (bullet.destroyed(tank)) {
          tanks.remove(j);
          bullets.remove(i);
          break; 
        }
      }
    } else {
        bullets.remove(i);
    }
  }
    
  for (int i = 0; i < powerUps.size(); i++) {
      powerUps.get(i).display();
  }

    //map.display();
}
  
  public void spawnPowerUp() {
    
  }
  
  public int win() {
    if (!multiplayer) {
      if (tanks.size() == 0) {
        return 0;
      }
      if (NPCs.size() == 0) {
        return 1;
      }
    }
    else {
      if (tanks.size() == 0) {
        return 0;
      }
      if (tanks.size() == 1) {
        if (tanks.get(0).num == 1) {
          return 1;
        }
        else if (tanks.get(0).num == 2) {
          return 2;
        }
      }
    }
    return -2;
  }

}
