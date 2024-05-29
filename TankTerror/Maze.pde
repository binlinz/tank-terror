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
        boolean[] direction = new boolean[4];
        int left = 0, right = 1, up = 2, down = 3;
        ArrayList<Integer> walls = new ArrayList<Integer>();
        walls.add(left);
        walls.add(right);
        walls.add(up);
        walls.add(down);
        if (j == 0){
          walls.remove(new Integer(2));
          direction[2] = true;
        }
        if (j == mazeCols - 1){
          walls.remove(new Integer(3));
          direction[3] = true;
        }
        if (i == 0){
          walls.remove(new Integer(0));
          direction[0] = true;
        }
        if (i == mazeRows - 1){
          walls.remove(new Integer(1));
          direction[1] = true;
        }
        
        if (walls.size() >= 3) {
          int ran = (int) (Math.random() * 100);
          if (ran < 100) {
            int rand = (int) (Math.random() * walls.size());
            direction[walls.remove(rand)] = true;
          }
          if (walls.size() >= 3) {
            if (ran < 15) {
              int rand = (int) (Math.random() * walls.size());
              direction[walls.remove(rand)] = true;
            }
          }
        }
        map[i][j] = new MazeUnit(startX, startY, unitSize, direction[0], direction[1], direction[2], direction[3], map);
      }
    }
    for (int j = 0; j < mazeRows; j++) {
      for (int i = 0; i < mazeCols; i++) {
        map[i][j].fixUnits(i, j);
      }
    }
    tagVisit(0, 0);
    fixMaze();
  }
  
  public void makeMaze(){
    for (int i = 0; i < mazeRows; i++) {
      for (int j = 0; j < mazeCols; j++) {
        MazeUnit unit = map[i][j];
        unit.makeUnits();
      }
    }
  }
  
  public boolean tagVisit(int i, int j){
    MazeUnit start = map[i][j];
    if (start.getVisit()){
      return true;
    }
    else{
      start.visited();
    }
    if (!start.getLeft()) tagVisit(i, j - 1);
    if (!start.getRight()) tagVisit(i, j + 1);
    if (!start.getDown()) tagVisit(i + 1, j);
    if (!start.getUp()) tagVisit(i - 1, j);
    return true; //for compiling
  }
  
  public void fixMaze(){
    for (int x = 0; x < mazeRows; x++){
      for (int y = 0; y < mazeCols; y++){
        if (map[x][y].getVisit() == false){
          int rand = (int)(Math.random() * 4);
          if (rand == 0){
            map[x][y].leftWall = false;
          }
          if (rand == 1){
            map[x][y].rightWall = false;
          }
          if (rand == 2){
            map[x][y].topWall = false;
          }
          if (rand == 3){
            map[x][y].bottomWall = false;
          }
        }
      }
    }
  }
}
