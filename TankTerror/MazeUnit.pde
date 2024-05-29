public class MazeUnit{
  boolean leftWall, rightWall, topWall, bottomWall;
  int startX, startY;
  boolean visit;
  int unitSize;
  MazeUnit maze[][];
  
  public MazeUnit(int startX, int startY, int unitSize, boolean left, boolean right, boolean top, boolean down, MazeUnit[][] map){
    leftWall = left;
    rightWall = right;
    topWall = top;
    bottomWall = down;
    visit = false;
    this.startX = startX;
    this.startY = startY;
    this.unitSize = unitSize;
    this.maze = map;
  }
    
  public void makeUnits(){
    stroke(255);
    if (topWall) line(startX, startY, startX + unitSize, startY);
    if (rightWall) line(startX + unitSize, startY, startX + unitSize, startY + unitSize);
    if (bottomWall) line(startX + unitSize, startY + unitSize, startX, startY + unitSize);
    if (leftWall) line(startX, startY + unitSize, startX, startY);
  }
  
  public void fixUnits(int i, int j){
    if (j > 0 && maze[i][j - 1].getRight() == true){
      leftWall = true;
    }
    if (j < 7 && maze[i][j + 1].getLeft() == true){
      rightWall = true;
    }
    if (i > 0 && maze[i - 1][j].getDown() == true){
      topWall = true;
    }
    if (i < 7 && maze[i + 1][j].getUp() == true){
      bottomWall = true;
    }
  }
  
  public boolean getVisit(){
    return visit;
  }
  
  public void visited(){
    visit = true;
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
