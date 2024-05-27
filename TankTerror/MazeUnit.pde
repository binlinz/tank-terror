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
    
  public void makeUnits(){
    stroke(255);
    line(startX, startY, startX + unitSize, startY);
    line(startX + unitSize, startY, startX + unitSize, startY + unitSize);
    line(startX + unitSize, startY + unitSize, startX, startY + unitSize);
    line(startX, startY + unitSize, startX, startY);
  }
}
