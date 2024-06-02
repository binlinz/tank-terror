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
    ellipse(x,y, 4,4);
    if (red(pixel) >= 200 && blue(pixel) >= 200 && green(pixel) >= 200){
      return true;
    }
    return false;
  }
}
