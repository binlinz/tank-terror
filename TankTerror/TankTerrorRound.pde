public class TankTerrorRound {
  public ArrayList<Tank> tanks;
  private color[][] map;
  private ArrayList<Bullet> bullets;
  private ArrayList<PowerUp> powerUps;
  private int powerUpTimer;
  private boolean multiplayer;
  
  public TankTerrorRound(boolean multiplayer) {
    this.multiplayer = multiplayer;
    tanks = new ArrayList<Tanks>();
    bullets = new ArrayList<Bullets>();
    powerUps = new ArrayList<PowerUp>();
    powerUpTimer = 10;
  }
  
  public color[][] generateMap() {
    
  }
  
  public void advanceRound() {
    
  }
  
  public void spawnPowerUp() {
    
  }
  
  public int win() {
    
  }
  
}
