public class Tank{
  PVector position;
  int bulletTimer;
  
  public Tank(){
    bulletTimer = 5;
    position = new PVector(Math.random() * width, Math.random() * height);
    
  }

  public void attack() {
  }
  
}
