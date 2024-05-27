public class TankTerrorRound {
  public ArrayList<Tank> tanks;
  private color[][] map;
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
    Maze maze = new Maze(8, 8, 125);
    maze.makeMaze();
    return null;
  }
  
  public void advanceRound() {
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
