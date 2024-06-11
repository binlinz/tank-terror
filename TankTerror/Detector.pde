public class Detector{
  int x, y;
  int size;
  
  public Detector(int x, int y, int size){
    this.x = x;
    this.y = y;
    this.size = size;
    fill(0);
  }
  
  public boolean detect(){
    color pixel = get(x, y);
    if (red(pixel) >= 240 && blue(pixel) >= 240 && green(pixel) >= 240){
      return true;
    }
    return false;
  }
}
