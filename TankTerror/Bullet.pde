public class Bullet {
  PVector position;
  PVector velocity;
  PVector checkLeftPosition;
  PVector checkRightPosition;
  PVector checkUpPosition;
  PVector checkDownPosition;
  private PowerUp special;
  private Tank parentTank;
  private int timeCreated;
  private int timeElapsed;
  private float rotation;
  public boolean active;

  public Bullet(float x, float y, Tank parent) {
      parentTank = parent;
      rotation = (float)parentTank.rotation;
      position = new PVector(x + 30 * cos((float) parentTank.rotation), y + 30 * sin((float) parentTank.rotation));
      velocity = new PVector(3 * cos((float) parentTank.rotation), 3 * sin((float) parentTank.rotation)); 
      timeCreated = millis();
      active = true;
  }

  public void display() {
      fill(0);
      circle(position.x, position.y, 11);
  }

  public void advance() {
      int currentTime = millis();
      int timeElapsed = currentTime - timeCreated;
      if (timeElapsed <= 8500) {            
          position.add(velocity);
      } else {
         active = false;
      }
  }

  public boolean destroyed(Tank tank) {
    float distance = dist(position.x, position.y, tank.x, tank.y);
    return distance < 30; 
}

  public boolean isActive() {
      return active;
  }
  
  public void bounce(){
    checkLeftPosition = new PVector((position.x - 7), position.y);
    checkRightPosition = new PVector((position.x + 7), position.y);
    checkUpPosition = new PVector((position.x), position.y - 7);
    checkDownPosition = new PVector((position.x), position.y + 7);
    color pixelL = get((int)checkLeftPosition.x, (int)checkLeftPosition.y);
    color pixelR = get((int)checkRightPosition.x, (int)checkRightPosition.y);
    color pixelU = get((int)checkUpPosition.x, (int)checkUpPosition.y);
    color pixelD = get((int)checkDownPosition.x, (int)checkDownPosition.y);
    if (red(pixelL) >= 200 && blue(pixelL) >= 200 && green(pixelL) >= 200){
      if (velocity.x < 0) {
        velocity.x *= -1;
      }
    }
    if (red(pixelR) >= 200 && blue(pixelR) >= 200 && green(pixelR) >= 200){
      if (velocity.x > 0) {
        velocity.x *= -1;
      }
    }
    if (red(pixelU) >= 200 && blue(pixelU) >= 200 && green(pixelU) >= 200){
      if (velocity.y < 0) {
        velocity.y *= -1;
      }
    }
    if (red(pixelD) >= 200 && blue(pixelD) >= 200 && green(pixelD) >= 200){
      if (velocity.y > 0) {
        velocity.y *= -1;
      }
    }
  }
}
