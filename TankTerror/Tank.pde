abstract class Tank{
  public float x;
  public float y;
  public int bulletTimer;
  public double rotation;
  
  public Tank() {
    
  }
  
  public Tank(int x, int y){
    bulletTimer = 5;
    this.x = x;
    this.y = y;
    rotation = 1;
  }

  public void destroy(TankTerrorRound round) {
    round.tanks.remove(this);
  }
  
  public void display(){
    translate(x, y);

    rotate((float) rotation);
    rect(-25, -25, 50, 50);
  }  
  
  abstract void move();
  abstract void attack();
  
  //change controls depending on what player is
  
}
