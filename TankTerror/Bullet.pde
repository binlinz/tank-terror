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
   frameRate(5);
   circle(x, y, 8); 
   fill(255);
   stroke(0);
 } 
 
 public void advance() {
   int start = millis();
   while(timeElapsed <= 5000) {
     int end = millis();                                                                                                                                                                                          
     timeElapsed = end-start;
     x += cos((float) parentTank.rotation);
     y += sin((float) parentTank.rotation); 
     display();
   }
 }
 
 public void destroy() {
   
 }
}
