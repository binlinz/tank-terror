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
        boolean removed = false;

      for (int j = round.tanks.size() - 1; j >= 0; j--) {
        Tank tank = round.tanks.get(j);
        if (this.destroyed(tank)) {
          round.tanks.remove(j);
          if (!removed) {
            round.bullets.remove(this);
            removed = true;
          }
          break;
        }
      }
      for (int j = round.NPCs.size() - 1; j >= 0; j--) {
          Tank npc = round.NPCs.get(j);
        if (this.destroyed(npc)){
          round.NPCs.remove(j);
          if (!removed) {
            round.bullets.remove(this);
            removed = true;
          }
          break;
        }
       }

    }
  } 
  
} 
