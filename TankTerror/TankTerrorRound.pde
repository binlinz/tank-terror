public class TankTerrorRound {
  public ArrayList<Tank> tanks;
  public ArrayList<NPCTank> NPCs;
  private Maze map;
  public ArrayList<Bullet> bullets;
  public ArrayList<PowerUp> powerUps; // turn into public
  //private int powerUpTimer;
  private boolean multiplayer;
  private int timeCreated;
  
  public TankTerrorRound(boolean multiplayer) {
    this.multiplayer = multiplayer;
    tanks = new ArrayList<Tank>();
    NPCs = new ArrayList<NPCTank>();
    bullets = new ArrayList<Bullet>();
    powerUps = new ArrayList<PowerUp>();
  }
  
  public void generateMap() {
    map = new Maze(8, 8, 125);
    while (map.countWalls() < 70){
      map = new Maze(8, 8, 125);
    }
    map.makeMaze();
    tanks.add(new PlayerTank(1));
    if (multiplayer) {
      tanks.add(new PlayerTank(2));
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
    
    for (int i = 0; i < tanks.size(); i++) {
      Tank tank = tanks.get(i);
      tank.display();
      tank.move();
      tank.attack();
    }
    
    for (int i = 0; i < NPCs.size(); i++){
      Tank npc = NPCs.get(i);
      npc.display();
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
    return 0;
  }

}
