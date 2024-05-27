public class TankTerrorRound {
  public ArrayList<Tank> tanks;
  private Maze map;
  private ArrayList<Bullet> bullets;
  private ArrayList<PowerUp> powerUps;
  private int powerUpTimer;
  private boolean multiplayer;
  
  public TankTerrorRound(boolean multiplayer) {
    this.multiplayer = multiplayer;
    tanks = new ArrayList<Tank>();
    bullets = new ArrayList<Bullet>();
    powerUps = new ArrayList<PowerUp>();
    powerUpTimer = 10;
  }
  
  public color[][] generateMap() {
    tanks.add(new PlayerTank(1));
    map = new Maze(8, 8, 125);
    map.makeMaze();
    return null;
  }
  
  public void advanceRound() {
    for (int j = 0; j < map.mazeRows; j++) {
      for (int i = 0; i < map.mazeCols; i++) {
        map.map[j][i].makeUnits();
      }
    }
    
    for (int i = 0; i < tanks.size(); i++) {
      tanks.get(i).display();
      tanks.get(i).move();
    }
  }
  
  public void spawnPowerUp() {
    
  }
  
  public int win() {
    return 0;
  }
  
}
