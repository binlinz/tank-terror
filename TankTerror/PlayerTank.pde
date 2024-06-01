public class PlayerTank extends Tank { 
  private ArrayList<PowerUp> playerPower;
  private int player;
  
  public PlayerTank(int num) { 
    super((int)(Math.random() * 8) * 125 + 72, (int)(Math.random() * 8) * 125 + 72, num);
    player = num;
    playerPower = new ArrayList<PowerUp>();
  }
  
  public void attack() { 
    if (keys['q'] || keys['Q']) { 
          Bullet bullet = new Bullet(x, y, this); 
          round.bullets.add(bullet);
          bullet.advance();
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
  
  public void getPowerUp() { 
  } 
} 
