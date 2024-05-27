public class PlayerTank extends Tank { 
  private ArrayList<PowerUp> playerPower;
  private int player;
  
  public PlayerTank(int num) { 
    super((int)(Math.random() * (width - 100)), (int)(Math.random() * (height - 100)));
    player = num;
    playerPower = new ArrayList<PowerUp>();

  }
  
  public void attack() { 
  }
  
  public void move() { 
        if (player == 1) {
            if (keys['w'] || keys['W']) { 
                x += cos((float) rotation);
                y += sin((float) rotation); 
            }
            if (keys['a'] || keys['A']) { 
                rotation -= 0.05;
            }
            if (keys['s'] || keys['S']) { 
                x -= cos((float) rotation);
                y -= sin((float) rotation); 
            }
            if (keys['d'] || keys['D']) {
                rotation += 0.05;
            }
        }
    } 
  
  public void getPowerUp() { 
  } 
} 
