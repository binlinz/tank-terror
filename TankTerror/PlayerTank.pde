public class PlayerTank extends Tank { 
  private ArrayList<PowerUp> playerPower;
  private int player;
  
  public PlayerTank(int num) { 
    super((int)(Math.random() * (width - 100)), (int)(Math.random() * (height - 100)), num);
    player = num;
    playerPower = new ArrayList<PowerUp>();
  }
  
  public void attack() { 
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
        if (keys['s'] || keys['S']) { 
            x -= cos((float) rotation);
            y -= sin((float) rotation); 
        }
        if (keys['d'] || keys['D']) {
            rotation += 0.05;
            rotation %= (2 * Math.PI);
        }
    }
    if (player == 2) {
        if (keys[UP]) { 
            x += cos((float) rotation);
            y += sin((float) rotation); 
        }
        if (keys[LEFT]) { 
            rotation -= 0.05;
            if (rotation < 0) {
              rotation = 2 * Math.PI + rotation % (2 * Math.PI);
            }
        }
        if (keys[DOWN]) { 
            x -= cos((float) rotation);
            y -= sin((float) rotation); 
        }
        if (keys[RIGHT]) {
            rotation += 0.05;
            rotation %= (2 * Math.PI);
        }
    }
  } 
  
  public boolean canMoveForward() {
    return true;
    //check the front 35 pixels for white
  }
  
  public void getPowerUp() { 
  } 
} 
