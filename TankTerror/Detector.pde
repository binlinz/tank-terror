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
    if (red(pixel) >= 230 && blue(pixel) >= 230 && green(pixel) >= 230){
      return true;
    }
    return false;
  }
}
