public class Maze{
  int mazeRows, mazeCols;
  int unitSize;
  MazeUnit[][] map;
  
  public Maze(int rows, int cols, int unitSize){
    this.unitSize = unitSize;
    mazeRows = rows;
    mazeCols = cols;
    for (int j = 0; j < mazeRows; j++) {
      for (int i = 0; i < mazeCols; i++) {
        int startX, startY;
        startX = i * unitSize;
        startY = j * unitSize;
        map = new MazeUnit[mazeRows][mazeCols];
        map[i][j] = new MazeUnit(startX, startY, unitSize);
      }
    }
  }
  
  public void makeMaze(){
    for (int j = 0; j < mazeRows; j++) {
      for (int i = 0; i < mazeCols; i++) {
        MazeUnit unit = map[i][j];
        unit.makeUnits();
      }
    }
  }
}
