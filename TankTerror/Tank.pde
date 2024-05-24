abstract class Tank{
  PVector position;
  int bulletTimer;
  int player;
  
  public Tank(int x, int y, int player){
    bulletTimer = 5;
    position = new PVector(x, y);
    this.player = player;
  }

  public void destroy(TankTerrorRound round) {
    round.tanks.remove(this);
  }
  
  
  //change controls depending on what player is
