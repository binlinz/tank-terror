public class Maze{
  int mazeRows, mazeCols;
  int unitSize;
  MazeUnit[][] map;
  int totalVisits;
  
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
            if (ran < 33) {
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
    fixMaze();
    tagVisit(0, 0, 0);
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
  
  public boolean tagVisit(int i, int j, int count){
    totalVisits = count;
    MazeUnit start = map[i][j];
    start.visited();
    totalVisits++;
    if (totalVisits == 64){
      return true;
    }
    if (!start.getLeft() && j > 0 && map[i][j - 1].getVisit() == false) tagVisit(i, j - 1, totalVisits);
    if (!start.getRight() && j < 7 && map[i][j + 1].getVisit() == false) tagVisit(i, j + 1, totalVisits);
    if (!start.getDown() && i < 7 && map[i + 1][j].getVisit() == false) tagVisit(i + 1, j, totalVisits);
    if (!start.getUp() && i > 0 && map[i - 1][j].getVisit() == false) tagVisit(i - 1, j, totalVisits);
    return true;
  }
  
  public void fixMaze(){
    for (int x = 0; x < mazeRows; x++){
      for (int y = 0; y < mazeCols; y++){
        if (map[x][y].getVisit() == false){
          int rand = (int)(Math.random() * 4);
          if (rand == 0){
            map[x][y].leftWall = false;
            if (x > 0){
              map[x - 1][y].setRight(false);
            }
          }
          if (rand == 1){
            map[x][y].rightWall = false;
            if (x < 7){
              map[x + 1][y].setLeft(false);
            }
          }
          if (rand == 2){
            map[x][y].topWall = false;
            if (y > 0){
              map[x][y - 1].setDown(false);
            }
          }
          if (rand == 3){
            map[x][y].bottomWall = false;
            if (y < 7){
              map[x][y + 1].setUp(false);
            }
          }
        }
      }
    }
  }
}
