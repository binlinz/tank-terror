public class Maze{
  int mazeRows, mazeCols;
  int unitSize;
  MazeUnit[][] map;
  int totalVisits;
  int counter = 0;
  
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
          walls.remove(Integer.valueOf(2));
          direction[2] = true;
        }
        if (j == mazeCols - 1){
          walls.remove(Integer.valueOf(3));
          direction[3] = true;
        }
        if (i == 0){
          walls.remove(Integer.valueOf(0));
          direction[0] = true;
        }
        if (i == mazeRows - 1){
          walls.remove(Integer.valueOf(1));
          direction[1] = true;
        }
        
        if (walls.size() >= 3) {
          int ran = (int) (Math.random() * 100);
          if (ran < 60) {
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
    tagVisit(0, 0);
    boolean hasIssue = hasMoreIssues();
    System.out.println(hasIssue);
    while (hasIssue) {
      fixMaze();
      clearTags();
      tagVisit(0, 0);
      hasIssue = hasMoreIssues();
    }
  }
  
  public void clearTags() {
    for (int i = 0; i < mazeRows; i++) {
      for (int j = 0; j < mazeCols; j++) {
        map[i][j].setVisit(false);
      }
    }
  }
  
  public boolean hasMoreIssues() {
      for (int i = 0; i < mazeRows; i++) {
        for (int j = 0; j < mazeCols; j++) {
          if (map[i][j].visit == false) {
            System.out.println(i + " " + j);
            return true;
          }
        }
      }
      return false;
  }
  
  public void makeMaze(){
    for (int i = 0; i < mazeRows; i++) {
      for (int j = 0; j < mazeCols; j++) {
        MazeUnit unit = map[i][j];
        unit.makeUnits();
      }
    }
  }
  
  
  public void display() {
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        if (map[i][j].getVisit()) {
          rect(i * 125, j * 125, 20, 20);
        }
      }
    }
    
  }
  public int tagVisit(int i, int j){
    MazeUnit start = map[i][j];
    start.visited();
    totalVisits++;
    if (!start.getLeft() && i > 0 && !map[i - 1][j].getRight() && map[i - 1][j].getVisit() == false) {
      counter++;
      tagVisit(i - 1, j);
    }
    if (!start.getRight() && i < mazeCols - 1 && !map[i + 1][j].getLeft() && map[i + 1][j].getVisit() == false) { 
      counter++;
      tagVisit(i + 1, j);
    }
    if (!start.getDown() && j < mazeRows - 1 && !map[i][j + 1].getUp() && map[i][j + 1].getVisit() == false) { 
      counter++;
      tagVisit(i, j + 1);
    }
    if (!start.getUp() && j > 0 && !map[i][j - 1].getDown() && map[i][j - 1].getVisit() == false) {
      counter++;
      tagVisit(i, j - 1);
    }
    return counter;
  }
  
  public void fixMaze(){
    for (int y = 0; y < mazeRows; y++){
      for (int x = 0; x < mazeCols; x++){
        if (map[x][y].getVisit() == false){
          ArrayList<Integer> walls = new ArrayList<Integer>();
          if ((map[x][y].getLeft() || (map[x - 1][y].getRight() && x != 0)) && x != 0) {
            walls.add(0);
          }
          if ((map[x][y].getRight() || (map[x + 1][y].getLeft() && x != mazeRows - 1)) && x != mazeRows - 1) {
            walls.add(1);
          }
          if ((map[x][y].getUp() || (map[x][y - 1].getDown() && y != 0)) && y != 0) {
            walls.add(2);
          }
          if ((map[x][y].getDown() || (map[x][y + 1].getUp() && y != mazeCols - 1)) && y != mazeCols - 1) {
            walls.add(3);
          }
          System.out.println(walls.size());
          if (walls.size() == 0) break;
          int rand = (int)(Math.random() * walls.size());
          int wallRemove = walls.remove(rand);
          if (wallRemove == 0){
            map[x][y].leftWall = false;
            if (x > 0){
              map[x - 1][y].setRight(false);
            }
          }
          if (wallRemove == 1){
            map[x][y].rightWall = false;
            if (x < mazeCols - 1){
              map[x + 1][y].setLeft(false);
            }
          }
          if (wallRemove == 2){
            map[x][y].topWall = false;
            if (y > 0){
              map[x][y - 1].setDown(false);
            }
          }
          if (wallRemove == 3){
            map[x][y].bottomWall = false;
            if (y < mazeCols - 1){
              map[x][y + 1].setUp(false);
            }
          }
        }
      }
    }
  }
}
