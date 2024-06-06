public class PlayerTank extends Tank { 
  public ArrayList<PowerUp> playerPower;
  private int player;
  private int lastTime;
  private boolean firstTime = true;
  public int timeBetweenBullets;
  public int timeStartRapid;
  private boolean rapid;
  
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
            x += cos((float) rotation);
            y += sin((float) rotation); 
        }
        if (keys['a'] || keys['A']) { 
            rotation -= 0.05;
            if (rotation < 0) {
              rotation = 2 * Math.PI + rotation % (2 * Math.PI);
            }
        }
        if (keys['s'] || keys['S'] && canMoveBackward()) { 
            x -= cos((float) rotation);
            y -= sin((float) rotation); 
        }
        if (keys['d'] || keys['D']) {
            rotation += 0.05;
            rotation %= (2 * Math.PI);
        }
    }
    if (player == 2) {
        if (keys[UP] && canMoveForward()) { 
            x += cos((float) rotation);
            y += sin((float) rotation); 
        }
        if (keys[LEFT]) { 
            rotation -= 0.05;
            if (rotation < 0) {
              rotation = 2 * Math.PI + rotation % (2 * Math.PI);
            }
        }
        if (keys[DOWN] && canMoveBackward()) { 
            x -= cos((float) rotation);
            y -= sin((float) rotation); 
        }
        if (keys[RIGHT]) {
            rotation += 0.05;
            rotation %= (2 * Math.PI);
        }
    }
  } 
  
  public void calcNPCArr(int[][] arr, int i, int j, int curr) { 
    if (curr <= arr[i][j]) {
      System.out.println(curr);
      return;
    }
    arr[i][j] = curr;
    curr--;
    MazeUnit start = round.map.map[i][j];
    MazeUnit[][] map = round.map.map;
    if (i > 0 && !start.getLeft() && !map[i - 1][j].getRight()) {
      calcNPCArr(arr, i - 1, j, curr);
    }
    if (i < round.map.mazeCols - 1 && !start.getRight() && !map[i + 1][j].getLeft()) {
      calcNPCArr(arr, i + 1, j, curr);
    }
    if (j > 0 && !start.getUp() && !map[i][j - 1].getDown()) {
      calcNPCArr(arr, i, j - 1, curr);
    }
    if (j < round.map.mazeRows - 1 && !start.getDown() && !map[i][j + 1].getUp()) {
      calcNPCArr(arr, i, j + 1, curr);
    }
  } 
} 
