public class NPCTank extends Tank { 
  public int nearestX;
  public int nearestY;
  
  public NPCTank(int num){
    super((int)(Math.random() * 8) * 125 + 72.5, (int)(Math.random() * 8) * 125 + 72.5, num);
  }
  
  public void attack() { 
    
  }
  
  public void move() { 
    
  } 
  
  public void move(int[][] moveArr) { 
    
    x+=2.5;
  } 

  
  public void nearestTank(){

  }
  
} 
