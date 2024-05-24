public class PowerUp { 
   private PVector position;
   private String type;
   
   public PowerUp() { 
      position = new PVector(Math.random() * width, Math.random() * height);
   }
   
   public void generatePowerUp() { 
   }
   
   public String getType() { 
     return type;
   }
}
