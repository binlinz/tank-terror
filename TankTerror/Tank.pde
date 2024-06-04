abstract class Tank{
  public float x;
  public float y;
  public int bulletTimer;
  public double rotation;
  private color col;  
  Detector BorderR;
  Detector BorderB;
  Detector BorderL;
  Detector BorderU;
  Detector BorderUR;
  Detector BorderDR;
  Detector BorderUL;
  Detector BorderDL;
  public int unitX;
  public int unitY;
  public boolean isPlayerTank;
  int num;
  
  public Tank() {
    
  }
  
  public Tank(int x, int y, int num){
    this.num = num;
    bulletTimer = 5;
    this.x = x;
    this.y = y;
    rotation = Math.PI;
    if (num == 1) {
      col = color(90, 199, 80);
      isPlayerTank = true;
    }
    if (num == 2) {
      col = color(199, 131, 80);
      isPlayerTank = true;
    }
    if (num == 3) {
      col = color(240, 38, 38);
    }
  }

  public void destroy() {
    round.tanks.remove(this);
    round.NPCs.remove(this);
  }
  
  public void display(){
    pushMatrix();
    translate(x, y);
    rotate((float) rotation);
    fill(col);
    ellipse(0, 0, 50, 50);
    fill(0);
    rect(-5, -7, 30, 16);
    BorderR = new Detector ((int)x + 26, (int)y, 5);
    BorderB = new Detector ((int)x, (int)y + 26, 5);
    BorderL = new Detector ((int)x - 26, (int)y, 5); 
    BorderU = new Detector ((int)x, (int)y - 26, 5);
    BorderUR = new Detector((int) (x + 18.3847763109), (int) (y - 18.3847763109), 5);
    BorderDR = new Detector((int) (x + 18.3847763109), (int) (y + 18.3847763109), 5);
    BorderUL = new Detector((int) (x - 18.3847763109), (int) (y - 18.3847763109), 5);
    BorderDL = new Detector((int) (x - 18.3847763109), (int) (y + 18.3847763109), 5);
    popMatrix();
  }  
  
  public boolean canMoveForward() {
    if (rotation == 0) {
      return !BorderR.detect() && !BorderUR.detect() && !BorderDR.detect();
    }
    if (rotation > 0 && rotation < (Math.PI * 1 / 2)) {
      return !BorderR.detect() && !BorderB.detect() && !BorderDR.detect();
    }
    if (rotation == (Math.PI * 1 / 2)) {
      return !BorderB.detect() && !BorderDR.detect() && !BorderDL.detect();
    }
    if (rotation >= (Math.PI * 1 / 2) && rotation < (Math.PI)) {
      return !BorderB.detect() && !BorderL.detect() && !BorderDL.detect();
    }
    if (rotation == (Math.PI)) {
      return !BorderL.detect() && !BorderUL.detect() && !BorderDL.detect();
    }
    if (rotation >= (Math.PI) && rotation < (Math.PI * 3 / 2)) {
      return !BorderL.detect() && !BorderU.detect() && !BorderUL.detect();
    }
    if (rotation == (Math.PI * 3 / 2)) {
      return !BorderL.detect() && !BorderR.detect() && !BorderU.detect();
    }
    if (rotation >= (Math.PI * 3 / 2) && rotation < (Math.PI * 2)) {
      return !BorderU.detect() && !BorderR.detect() && !BorderUR.detect();
    }
    return true;
  }
  
  public boolean canMoveBackward(){
    if (rotation == (Math.PI)) {
      return !BorderR.detect() && !BorderUR.detect() && !BorderDR.detect();
    }
    if (rotation >= (Math.PI) && rotation < (Math.PI * 3 / 2)) {
      return !BorderR.detect() && !BorderB.detect() && !BorderDR.detect();
    }
    if (rotation == (Math.PI * 3 / 2)) {
      return !BorderB.detect() && !BorderDR.detect() && !BorderDL.detect();
    }
    if (rotation >= (Math.PI * 3 / 2) && rotation < (Math.PI * 2)) {
      return !BorderB.detect() && !BorderL.detect() && !BorderDL.detect();
    }
    if (rotation == 0) {
      return !BorderL.detect() && !BorderUL.detect() && !BorderDL.detect();
    }
    if (rotation >= 0 && rotation < (Math.PI * 1 / 2)) {
      return !BorderL.detect() && !BorderU.detect() && !BorderUL.detect();
    }
    if (rotation == (Math.PI * 1 / 2)) {
      return !BorderL.detect() && !BorderR.detect() && !BorderU.detect();
    }
    if (rotation >= (Math.PI * 1 / 2) && rotation < (Math.PI)) {
      return !BorderU.detect() && !BorderR.detect() && !BorderUR.detect();
    }

    return true;
  }
  
  abstract void move();
  abstract void attack();
  
  //change controls depending on what player is
  
}
