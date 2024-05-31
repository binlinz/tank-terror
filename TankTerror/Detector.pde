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
    System.out.println(x);
    System.out.println(y);
    color pixel = get(x, y);
    System.out.println(red(pixel));
    System.out.println(blue(pixel));
    System.out.println(green(pixel));
    if (red(pixel) == 255 && blue(pixel) == 255 && green(pixel) == 255){
      return true;
    }
    return false;
  }
}
