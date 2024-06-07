public class NPCTank extends Tank { 
  public int currDist;
  public PlayerTank near;
  public int nearestX;
  public int nearestY;
  public int currX; 
  public int currY;
  public ArrayList<Integer> moves;
  
  public NPCTank(int num){
    super((int)(Math.random() * 8) * 125 + 72.5, (int)(Math.random() * 8) * 125 + 72.5, num);
    currX = (int) (this.x / 125) + 1;
    currY = (int) (this.y / 125) + 1;
    moves = new ArrayList<Integer>();
  }
  
  public void attack() { 
    
  }
  
  public void move() { 
    ArrayList<Integer> move = new ArrayList<Integer>();

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

  }
  
}
