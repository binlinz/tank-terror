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
    if (keyPressed) {
        if (player == 1) {
          if (key == 'w') {
            x += cos((float) rotation);
            y += sin((float) rotation); 
          }
          if (key == 'a') {
            rotation -= 0.05;
          }
          if (key == 's') {
            x -= cos((float) rotation);
            y -= sin((float) rotation); 
          }
          if (key == 'd') {
            rotation += 0.05;
          }
        }
    }
  } 
  
  public void getPowerUp() { 
  } 
} 
