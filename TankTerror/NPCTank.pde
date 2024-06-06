public class NPCTank extends Tank { 
  public int nearestX;
  public int nearestY;
  
  public NPCTank(int num){
    super((int)(Math.random() * 8) * 125 + 72.5, (int)(Math.random() * 8) * 125 + 72.5, num);
  }
  
  public void attack() { 
    
  }
  
  public void move() { 
    
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
