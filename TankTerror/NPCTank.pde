public class NPCTank extends Tank { 
  public int currDist;
  public PlayerTank near;
  public int nearestX;
  public int nearestY;
  public int currX; 
  public int currY;
  public ArrayList<Integer> moves;
  
  public NPCTank(int num){
    super((int)(Math.random() * 8) * 125 + 72, (int)(Math.random() * 8) * 125 + 72, num);
    currX = (int) (this.x / 125) + 1;
    currY = (int) (this.y / 125) + 1;
    moves = new ArrayList<Integer>();
  }
  
  public void attack() { 
    
  }
  
  public void move() { 
    ArrayList<Integer> move = new ArrayList<Integer>();
    calcMove(currX, currY, move);
  } 
  
  public void nearestTank(PlayerTank player){
    float distance = dist(player.getX(), player.getY(), this.x, this.y);
    if (distance > currDist){
      currDist = (int) distance;
      near = player;
      nearestX = player.getX();
      nearestY = player.getY();
    }
  }
  
  public ArrayList<Integer> calcMove(int x, int y, ArrayList<Integer> move){
    if (x == nearestX && y == nearestY){
      return move;
    }
    Maze maze = round.map;
    MazeUnit start = round.map.map[x][y];
    if (!start.getLeft() && x > 0 && !maze.map[x - 1][y].getRight()) {
      move.add(1);
      calcMove(x - 1, y, move);
    }
    if (!start.getRight() && x < maze.mazeCols - 1 && !maze.map[x + 1][y].getLeft()) { 
      move.add(2);
      calcMove(x + 1, y, move);
    }
    if (!start.getDown() && y < maze.mazeRows - 1 && !maze.map[x][y + 1].getUp()) { 
      move.add(3);
      calcMove(x, y + 1, move);
    }
    if (!start.getUp() && y > 0 && !maze.map[x][y - 1].getDown()) {
      move.add(4);
      calcMove(x, y + 1, move);
    }
  }
}
