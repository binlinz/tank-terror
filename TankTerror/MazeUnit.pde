public class MazeUnit{
  boolean leftWall, rightWall, topWall, bottomWall;
  int startX, startY;
  int unitSize;
  
  public MazeUnit(int startX, int startY, int unitSize, boolean left, boolean right, boolean top, boolean down){
    leftWall = left;
    rightWall = right;
    topWall = top;
    bottomWall = down;
    this.startX = startX;
    this.startY = startY;
    this.unitSize = unitSize;
  }
    
  public void makeUnits(){
    stroke(255);
    strokeWeight(10);
    if (topWall) line(startX, startY, startX + unitSize, startY);
    if (rightWall) line(startX + unitSize, startY, startX + unitSize, startY + unitSize);
    if (bottomWall) line(startX + unitSize, startY + unitSize, startX, startY + unitSize);
    if (leftWall) line(startX, startY + unitSize, startX, startY);
    strokeWeight(1);
  }
  
  public boolean getLeft(){
    return leftWall;
  }
  
  public boolean getRight(){
    return rightWall;
  }
  
  public boolean getUp(){
    return topWall;
  }
  
  public boolean getDown(){
    return bottomWall;
  }
  
  public void setLeft(boolean left){
    leftWall = left;
  }
  
  public void setRight(boolean right){
    rightWall = right;
  }
  
  public void setUp(boolean up){
    topWall = up;
  }
  
  public void setDown(boolean down){
    bottomWall = down;
  }
}
