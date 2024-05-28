public class Maze{
  int mazeRows, mazeCols;
  int unitSize;
  MazeUnit[][] map;
  
  public Maze(int rows, int cols, int unitSize){
    this.unitSize = unitSize;
    mazeRows = rows;
    mazeCols = cols;
    map = new MazeUnit[mazeRows][mazeCols];
    for (int j = 0; j < mazeRows; j++) {
      for (int i = 0; i < mazeCols; i++) {
        int startX, startY;
        startX = i * unitSize;
        startY = j * unitSize;
        map[i][j] = new MazeUnit(startX, startY, unitSize);
      }
    }
  }
  
  public void makeMaze(){
    for (int i = 0; i < mazeRows; i++) {
      for (int j = 0; j < mazeCols; j++) {
        boolean[] direction = new boolean[4];
        int left = 0, right = 1, up = 2, down = 3;
        ArrayList<Integer> walls = new ArrayList<Integer>();
        walls.add(left);
        walls.add(right);
        walls.add(up);
        walls.add(down);
        MazeUnit unit = map[i][j];
        if (i == 0){
          walls.remove(new Integer(2));
          direction[2] = true;
        }
        if (i == mazeRows - 1){
          walls.remove(new Integer(3));
          direction[3] = true;
        }
        if (j == 0){
          walls.remove(new Integer(0));
          direction[0] = true;
        }
        if (j == mazeCols - 1){
          walls.remove(new Integer(1));
          direction[1] = true;
        }
        if (walls.size() == 3){
          int rand = (int) (Math.random() * 3);
          direction[walls.remove(rand)] = true;
        }
        if (walls.size() == 4){
          int rand = (int) (Math.random() * 4);
          direction[walls.remove(rand)] = true;
        }
        unit.makeUnits(direction[0], direction[1], direction[2], direction[3]);
      }
    }
  }
  
}
