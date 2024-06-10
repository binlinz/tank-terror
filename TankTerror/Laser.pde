public class Laser extends Bullet { 
  
  public Laser(float x, float y, Tank parent) { 
    super(x, y, parent);
    bulletLength = 200;
  }
  
  public void advance() {
    for (int i = 0; i < 60; i++) {
        display();
        super.advance();
        bounce();
      for (int j = round.tanks.size() - 1; j >= 0; j--) {
        Tank tank = round.tanks.get(j);
        if (this.destroyed(tank)) {
          round.tanks.remove(j);
          round.bullets.remove(this);
          break; 
        }
      }
    }
  } 
  
} 
