public class PlayerTank extends Tank { 
  public ArrayList<PowerUp> playerPower;
  private int player;
  private int lastTime;
  private boolean firstTime = true;
  public int timeBetweenBullets;
  public int timeStartRapid;
  private boolean rapid;
  public int unitX;
  public int unitY;
  
  public PlayerTank(int num) { 
    super((int)(Math.random() * 8) * 125 + 72, (int)(Math.random() * 8) * 125 + 72, num);
    player = num;
    playerPower = new ArrayList<PowerUp>();
    timeBetweenBullets = 8500;
    rapid = false;
  }
  
  public void attack() { 
    int currentTime = millis();
    
    if (rapid && currentTime - timeStartRapid >= 5000) {
      timeBetweenBullets = 8500;
      rapid = false;
    }
    
    if(currentTime - lastTime >= timeBetweenBullets || firstTime) {
      if(player == 1) { 
        if (keys['q'] || keys['Q']) { 
          shoot();
          lastTime = currentTime;
          firstTime = false;
        }
      } 
      if(player == 2) { 
        if (keys['/']) { 
          shoot();
          lastTime = currentTime;
          firstTime = false;
        }
      }
    }
  }
  
  
  public void shoot() {
    if (playerPower.size() > 0 && !rapid) {
      PowerUp p = playerPower.get(0);
      if (p.getType().equals("Laser") && !rapid) {
        Bullet bullet = new Laser(x, y, this); 
        round.bullets.add(bullet);
        playerPower.remove(0);
      }
      else if (p.getType().equals("Phase") && !rapid) {
        Bullet bullet = new Phase(x, y, this); 
        round.bullets.add(bullet);
        playerPower.remove(0);
      }
      else if (p.getType().equals("Rapid") && !rapid) {
        timeStartRapid = millis();
        timeBetweenBullets = 500;
        Bullet bullet = new Bullet(x, y, this); 
        round.bullets.add(bullet);
        rapid = true;
        playerPower.remove(0);
      }
    }
    else {
      Bullet bullet = new Bullet(x, y, this); 
      round.bullets.add(bullet);
    }
  }
  public void move() { 
    if (player == 1) {
        if ((keys['w'] || keys['W']) && canMoveForward()) { 
            x += 2.2 * cos((float) rotation);
            y += 2.2 * sin((float) rotation); 
        }
        if (keys['a'] || keys['A']) { 
            rotation -= 0.05;
            if (rotation < 0) {
              rotation = 2 * Math.PI + rotation % (2 * Math.PI);
            }
        }
        if (keys['s'] || keys['S'] && canMoveBackward()) { 
            x -= 2.2 * cos((float) rotation);
            y -= 2.2 * sin((float) rotation); 
        }
        if (keys['d'] || keys['D']) {
            rotation += 0.05;
            rotation %= (2 * Math.PI);
        }
    }
    if (player == 2) {
        if (keys[UP] && canMoveForward()) { 
            x += 2.2 * cos((float) rotation);
            y += 2.2 * sin((float) rotation); 
        }
        if (keys[LEFT]) { 
            rotation -= 0.05;
            if (rotation < 0) {
              rotation = 2 * Math.PI + rotation % (2 * Math.PI);
            }
        }
        if (keys[DOWN] && canMoveBackward()) { 
            x -= 2.2 * cos((float) rotation);
            y -= 2.2 * sin((float) rotation); 
        }
        if (keys[RIGHT]) {
            rotation += 0.05;
            rotation %= (2 * Math.PI);
        }
    }
  } 
  

  public void calcNPCArr(int[][] arr, int x, int y, int curr) { 
    if (curr <= arr[y][x]) {
      return;
    }
    arr[y][x] = curr;
    
    MazeUnit start = round.map.map[x][y];
    MazeUnit[][] map = round.map.map;
    if (x > 0 && !start.getLeft() && !map[x - 1][y].getRight()) {
      calcNPCArr(arr, x - 1, y, curr - 1);
    }
    if (x < round.map.mazeCols - 1 && !start.getRight() && !map[x + 1][y].getLeft()) {
      calcNPCArr(arr, x + 1, y, curr - 1);
    }
    if (y > 0 && !start.getUp() && !map[x][y - 1].getDown()) {
      calcNPCArr(arr, x, y - 1, curr - 1);
    }
    if (y < round.map.mazeRows - 1 && !start.getDown() && !map[x][y + 1].getUp()) {
      calcNPCArr(arr, x, y + 1, curr - 1);
    }
  } 
} 
