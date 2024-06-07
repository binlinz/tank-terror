public class NPCTank extends Tank { 
  public int currDist;
  public PlayerTank near;
  public int nearestX;
  public int nearestY;
  public int currX; 
  public int currY;
  public ArrayList<Integer> moves;
  
  public NPCTank(int num){
<<<<<<< HEAD
    super((int)(Math.random() * 8) * 125 + 72, (int)(Math.random() * 8) * 125 + 72, num);
    currX = (int) (this.x / 125) + 1;
    currY = (int) (this.y / 125) + 1;
    moves = new ArrayList<Integer>();
=======
    super((int)(Math.random() * 8) * 125 + 72.5, (int)(Math.random() * 8) * 125 + 72.5, num);
>>>>>>> 03d041ead31073995d9ff9c8b87e1ebd5ca4d332
  }
  
  public void attack() { 
    
  }
  
  public void move() { 
    ArrayList<Integer> move = new ArrayList<Integer>();
    calcMove(currX, currY, move);
  } 
  
<<<<<<< HEAD
  public void nearestTank(PlayerTank player){
    float distance = dist(player.getX(), player.getY(), this.x, this.y);
    if (distance > currDist){
      currDist = (int) distance;
      near = player;
      nearestX = player.getX();
      nearestY = player.getY();
    }
=======
  public void move(int[][] moveArr) { 
    nearestX = (int) x / 125;
    nearestY = (int) y / 125;
    System.out.println(x + "" + y);
    int side;
    int num;
    MazeUnit start = round.map.map[nearestY][nearestX];
    MazeUnit[][] map = round.map.map;

    if (nearestX > 0 && !start.getLeft() && !map[nearestY][nearestX - 1].getRight()) {
          x -= 2.5;
    }
    
  } 

  
  public void nearestTank(){

>>>>>>> 03d041ead31073995d9ff9c8b87e1ebd5ca4d332
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
