abstract class Tank{
  public float x;
  public float y;
  public int bulletTimer;
  public double rotation;
  private color col;  
  Detector BorderR;
  Detector BorderF;
  Detector BorderL;
  Detector BorderB;
  
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
        BorderR = new Detector ((int)x + 26, (int)y, 5);
    BorderB = new Detector ((int)x, (int)y + 26, 5);
    BorderL = new Detector ((int)x - 26, (int)y, 5); 
    BorderF = new Detector ((int)x, (int)y - 26, 5);

  }

  public void destroy() {
    round.tanks.remove(this);
  }
  
  public void display(){
    pushMatrix();
    translate(x, y);
    rotate((float) rotation);
    fill(col);
    ellipse(0, 0, 50, 50);
    fill(0);
    rect(-5, -7, 45, 15);
    popMatrix();
  }  
  
  public boolean canMoveForward() {
    if (BorderF.detect()){
      return false;
    }
    if (BorderL.detect()){
      return false;
    }
    if (BorderR.detect()){
      return false;
    }
    return true;
  }
  
  public boolean canMoveBackward(){
    if (BorderB.detect()){
      return false;
    }
    if (BorderL.detect()){
      return false;
    }
    if (BorderR.detect()){
      return false;
    }
    return true;
  }
  
  abstract void move();
  abstract void attack();
  
  //change controls depending on what player is
  
}
