public class Phase extends Bullet { 
  public Phase(float x, float y, Tank parent) { 
    super(x, y, parent);
  }
  
  public void bounce(){
    if (position.x <= 18 && velocity.x < 0) {
      velocity.x *= -1;
    }
    if (position.x >= width - 18 && velocity.x > 0) {
      velocity.x *= -1;
    }
    if (position.y <= 18 && velocity.y < 0) {
      velocity.y *= -1;
    }
    if (position.y >= width - 18 && velocity.y > 0) {
      velocity.y *= -1;
    }
  }
  
} 
