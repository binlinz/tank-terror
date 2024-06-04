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
  
  public void calcMove(int x, int y, ArrayList<Integer> move){
    if (x == nearestX && y = nearestY){
      return move;
    }
    MazeUnit start = map[x][y];
    if (!start.getLeft() && i > 0 && !map[currX - 1][currY].getRight()) {
      move.add(1);
      calcMove(currX - 1, j, move);
    }
    if (!start.getRight() && i < mazeCols - 1 && !map[currX + 1][currY].getLeft()) { 
      move.add(2);
      calcMove(currX + 1, currY, move);
    }
    if (!start.getDown() && j < mazeRows - 1 && !map[i][j + 1].getUp()) { 
      move.add(3);
      calcMove(currX, currY + 1, move);
    }
    if (!start.getUp() && j > 0 && !map[i][j - 1].getDown()) {
      move.add(4);
      calcMove(currX, currY + 1, move);
    }

  }
  }
}
