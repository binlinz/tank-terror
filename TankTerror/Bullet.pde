public class Bullet {
  PVector position;
  PVector velocity;
  PVector checkLeftPosition;
  PVector checkRightPosition;
  PVector checkUpPosition;
  PVector checkDownPosition;
  //private PowerUp special;
  public Tank parentTank;
  public int timeCreated;
  //private int timeElapsed;
  //private float rotation;
  public boolean active;
  int bulletLength;
  public boolean npcBullet;

  public Bullet(float x, float y, Tank parent) {
      parentTank = parent;
      //rotation = (float)parentTank.rotation;
      position = new PVector(x + 30 * cos((float) parentTank.rotation), y + 30 * sin((float) parentTank.rotation));
      velocity = new PVector(3 * cos((float) parentTank.rotation), 3 * sin((float) parentTank.rotation)); 
      timeCreated = millis();
      active = true;
      bulletLength = 8500;
      if (parent.isPlayerTank == false){
        npcBullet = true;
      }
    }
  
  public void display() {
      if (npcBullet){
        fill (255, 0, 0);
        circle(position.x, position.y, 11);
      }
      else{
        fill(0);
        circle(position.x, position.y, 11);
      }
  }

  public void advance() {
      int currentTime = millis();
      int timeElapsed = currentTime - timeCreated;
      if (timeElapsed <= bulletLength) {            
          position.add(velocity);
      } else {
         active = false;
      }
  }

  public boolean destroyed(Tank tank) {
    float distance = dist(position.x, position.y, tank.x, tank.y);
    if (tank.isPlayerTank == false && npcBullet == true){
      return false;
    }
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
    if (red(pixelL) >= 250 && blue(pixelL) >= 250 && green(pixelL) >= 250){
      if (velocity.x < 0) {
        velocity.x *= -1;
      }
    }
    if (red(pixelR) >= 250 && blue(pixelR) >= 250 && green(pixelR) >= 250){
      if (velocity.x > 0) {
        velocity.x *= -1;
      }
    }
    if (red(pixelU) >= 250 && blue(pixelU) >= 250 && green(pixelU) >= 250){
      if (velocity.y < 0) {
        velocity.y *= -1;
      }
    }
    if (red(pixelD) >= 250 && blue(pixelD) >= 250 && green(pixelD) >= 250){
      if (velocity.y > 0) {
        velocity.y *= -1;
      }
    }
  }
}
