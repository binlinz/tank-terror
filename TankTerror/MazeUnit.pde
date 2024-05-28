public class MazeUnit{
  boolean leftWall, rightWall, topWall, bottomWall;
  boolean created;
  int startX, startY;
  int unitSize;
  
  public MazeUnit(int startX, int startY ,int unitSize){
    leftWall = true;
    rightWall = true;
    topWall = true;
    bottomWall = true;
    created = false;
    this.startX = startX;
    this.startY = startY;
    this.unitSize = unitSize;
  }
    
  public void makeUnits(boolean left, boolean right, boolean up, boolean down){
    stroke(255);
    if (up) line(startX, startY, startX + unitSize, startY);
    if (right) line(startX + unitSize, startY, startX + unitSize, startY + unitSize);
    if (down) line(startX + unitSize, startY + unitSize, startX, startY + unitSize);
    if (left) line(startX, startY + unitSize, startX, startY);
  }
}
