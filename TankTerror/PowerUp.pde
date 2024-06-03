public class PowerUp { 
   private PVector position;
   private String type;
   public boolean show;
   public int initialTime;
   public int timeElapsed;
   public int currentTime;
   
   public PowerUp() { 
      position = new PVector(((int)(Math.random() * 80) + 25) + ((int)(Math.random() * round.map.mazeCols) * 125), ((int)(Math.random() * 80) + 25) + ((int)(Math.random() * round.map.mazeCols) * 125));
      type = generatePowerUp();
      //type = "Rapid";
      initialTime = millis();
   }
   
   public String generatePowerUp() { 
      int rand = (int) (Math.random() * 3);
      if (rand == 1){
        return "Laser";
      }
      if (rand == 2){
        return "Phase";
      }
      else return "Rapid";
   }
   
   public String getType() { 
     return type;
   }
   
   public void display() {
     fill(0);
     rect(position.x - 12.5, position.y - 12.5 , 25, 25);
     for (int i = 0; i < round.tanks.size(); i++) {
       PlayerTank temp = (PlayerTank) round.tanks.get(i);
       if (dist(position.x, position.y, temp.x, temp.y) < 35) {
         temp.playerPower.add(this);
         round.powerUps.remove(this);
         break;
       }
     }
   }
}
