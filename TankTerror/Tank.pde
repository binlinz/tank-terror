abstract class Tank{
  public float x;
  public float y;
  public int bulletTimer;
  public double rotation;
  private color col;
  
  public Tank() {
    
  }
  
  public Tank(int x, int y, int num){
    bulletTimer = 5;
    this.x = x;
    this.y = y;
    rotation = 1;
    if (num == 1) {
      col = color(90, 199, 80);
    }
    if (num == 2) {
      col = color(199, 131, 80);
    }
    if (num == 3) {
      col = color(240, 38, 38);
    }
    if (num == 4) {
      col = color(136, 38, 240);
    }
    if (num == 5) {
      col = color(38, 85, 240);
    }
  }

  public void destroy() {
    round.tanks.remove(this);
  }
  
  public void display(){
    pushMatrix();
    translate(x, y);
    rotate((float) rotation);
    fill(col);
    rect(-25, -25, 50, 50);
    fill(0);
    rect(-5, -7, 50, 15);
    popMatrix();
  }  
  
  abstract void move();
  abstract void attack();
  
  //change controls depending on what player is
  
}
