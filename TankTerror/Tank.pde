abstract class Tank{
  PVector position;
  int bulletTimer;
  
  public Tank(){
    bulletTimer = 5;
    position = new PVector((int) (Math.random() * width), (int) (Math.random() * height));
    
  }

  public void destroy(TankTerrorRound round) {
    round.tanks.remove(this);
  }
