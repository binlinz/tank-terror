public class NPCTank extends Tank { 
  public int nearestX;
  public int nearestY;
  public int distanceXLTraveled;
  public int distanceXRTraveled;
  public int distanceYUTraveled;
  public int distanceYDTraveled;
  private int dist = 150;
  private float tolerance = 0.09;
  
  public NPCTank(int num){
    super((int)(Math.random() * 8) * 125 + 72.5, (int)(Math.random() * 8) * 125 + 72.5, num);
  }
  
  public void attack() { 
    
  }
  
  public void move() { 
    if (rotation >= (Math.PI * 2)) {
      rotation %= Math.PI * 2;
    }
    if (rotation < 0) {
      rotation = Math.PI * 2 + rotation;
    }
  } 
  
  public void move(int[][] moveArr) { 
    nearestX = (int) x / 125;
    nearestY = (int) y / 125;
    MazeUnit start = round.map.map[nearestX][nearestY];
    MazeUnit[][] map = round.map.map;
    
    if (moveArr[nearestY][nearestX] == 97) {
      attack();
    }
    if (((nearestX > 0 && !start.getLeft() && !map[nearestX - 1][nearestY].getRight() && moveArr[nearestY][nearestX - 1] == moveArr[nearestY][nearestX] + 1) || (distanceXLTraveled % dist != 0)) && rotation >= Math.PI - tolerance && rotation <= Math.PI + tolerance) {
        x -= 2.5;
        distanceXLTraveled += 3;
    }
    else if ((nearestX < round.map.mazeCols - 1 && !start.getRight() && !map[nearestX + 1][nearestY].getLeft() && moveArr[nearestY][nearestX + 1] == moveArr[nearestY][nearestX] + 1 || distanceXRTraveled % dist != 0) && (rotation >= Math.PI * 2 - tolerance || rotation < tolerance)) {
        x += 2.5;
        distanceXRTraveled += 3;
    }
    else if ((nearestY > 0 && !start.getUp() && !map[nearestX][nearestY - 1].getDown() && moveArr[nearestY - 1][nearestX] == moveArr[nearestY][nearestX] + 1 || distanceYUTraveled % dist != 0) && rotation >= Math.PI * 3/2 - tolerance && rotation <= Math.PI * 3/2 + tolerance) {
        y -= 2.5;
        distanceYUTraveled += 3;
    }
    else if ((nearestY < round.map.mazeRows - 1 && !start.getDown() && !map[nearestX][nearestY + 1].getUp() && moveArr[nearestY + 1][nearestX] == moveArr[nearestY][nearestX] + 1 || distanceYDTraveled % dist != 0) && rotation >= Math.PI * 1/2 - tolerance && rotation <= Math.PI * 1/2 + tolerance) {
        y += 2.5;
        distanceYDTraveled += 3;
    }
    else {
      System.out.println(distanceXLTraveled % dist + distanceXRTraveled % dist + distanceYUTraveled % dist + distanceYDTraveled % dist);
      rotation += 0.18;
      move();
    }

    
  } 

  
  public void nearestTank(){

  }
  
} 
