public class Bullet {
 PVector position;
 PVector velocity;
 private PowerUp special;
 private Tank parentTank;
 private int timeCreated;
 private int timeElapsed;
 public boolean active;
 
 public Bullet(float x, float y, Tank parent) { 
   parentTank = parent;
   position = new PVector(x + 10 * cos((float) parentTank.rotation), y + 10 * sin((float) parentTank.rotation));
   velocity = new PVector(3 * cos((float) parentTank.rotation), 3 * sin((float) parentTank.rotation)); 
   timeCreated = millis();
   active = true;
 }
 
 public void display() { 
   fill(0);
   stroke(1);
   circle(position.x, position.y, 10);
 } 
 
 public void advance() {
   int currentTime = millis();
    int timeElapsed = currentTime - timeCreated;

    if (timeElapsed <= 5000) {
        position.add(velocity);
    } else { 
        active = false;
    }
 }
 
 public void destroy() {

 }
 
 public boolean isActive() {
   return active;
 }
}
