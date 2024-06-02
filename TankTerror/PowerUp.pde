public class PowerUp { 
   private PVector position;
   private String type;
   public boolean show;
   public int initialTime;
   public int timeElapsed;
   public int currentTime;
   
   public PowerUp() { 
      position = new PVector((int)(Math.random() * 1000), (int)(Math.random() * 1000));
      color pixel = get((int)position.x, (int)position.y);
      while (red(pixel) >= 200 && blue(pixel) >= 200 && green(pixel) >= 200){
         position = new PVector((int)Math.random() * 1000, (int)Math.random() * 1000);
      }
      type = generatePowerUp();
      initialTime = millis();
   }
   
   public String generatePowerUp() { 
      int rand = (int) (Math.random() * 3);
      if (rand == 1){
        return "Laser";
      }
      if (rand == 2){
        return "Ghost";
      }
      else return "Rapid";
   }
   
   public String getType() { 
     return type;
   }
   
   public void startSpawn(){
     currentTime = millis();
     timeElapsed = currentTime - initialTime;
     if (currentTime >= 15000){
       show = true;
     }
     show = false;
   }
}
