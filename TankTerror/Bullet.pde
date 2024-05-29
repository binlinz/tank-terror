public class Bullet {
 private float x;
 private float y;
 private PowerUp special;
 private Tank parentTank;
 private int timeElapsed;
 
 public Bullet(float x, float y, Tank parent) { 
   this.x = x;
   this.y = y;
   parentTank = parent;
 }
 
 public void display() { 
   circle(x, y, 8); 
 } 
 
 public void advance() {
   while(timeElapsed <= 5000) {
     timeElapsed = millis();
     display();
     x += cos((float) parentTank.rotation);
     y += sin((float) parentTank.rotation); 
   }
   timeElapsed = 0;
 }
 
 public void destroy() {
   
 }
}
