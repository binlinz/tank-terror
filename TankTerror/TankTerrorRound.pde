public class TankTerrorRound {
  public ArrayList<Tank> tanks;
  public ArrayList<NPCTank> NPCs;
  private Maze map;
  public ArrayList<Bullet> bullets;
  private ArrayList<PowerUp> powerUps;
  private int powerUpTimer;
  private boolean multiplayer;
  
  public TankTerrorRound(boolean multiplayer) {
    this.multiplayer = multiplayer;
    tanks = new ArrayList<Tank>();
    NPCs = new ArrayList<NPCTank>();
    bullets = new ArrayList<Bullet>();
    powerUps = new ArrayList<PowerUp>();
    powerUpTimer = 10;
  }
  
  public void generateMap() {
    tanks.add(new PlayerTank(1));
    if (multiplayer) {
      tanks.add(new PlayerTank(2));
    }
    else{
      NPCs.add(new NPCTank(3));
      NPCs.add(new NPCTank(3));
    }
    map = new Maze(8, 8, 125);
    while (map.countWalls() < 90){
      map = new Maze(8, 8, 125);
    }
    map.makeMaze();
  }
  
  public void advanceRound() {
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
      for (int j = tanks.size() - 1; j >= 0; j--) {
        Tank tank = tanks.get(j);
        Tank npc = NPCs.get(j);
        if (bullet.destroyed(tank)) {
          tanks.remove(j);
          bullets.remove(i);
          break; 
        }
        if (bullet.destroyed(npc)){
          NPCs.remove(j);
          bullets.remove(i);
          break;
        }
      }
    } else {
        bullets.remove(i);
    }
  }
    
    //map.display();
  }
  
  public void spawnPowerUp() {
    
  }
  
  public int win() {
    return 0;
  }

}
