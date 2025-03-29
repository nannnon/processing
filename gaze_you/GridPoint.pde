class GridPoint
{
  final int _x;
  final int _y;
  
  GridPoint(int x, int y)
  {
    _x = x;
    _y = y;
  }
  
  void display()
  {
    PVector vec = int2float(_x, _y);
    
    final float Len = 20;
    noStroke();
    fill(255);
    rect(vec.x - Len / 2, vec.y - Len / 2, Len, Len);
    
    PVector target = g_target.getCoord();
    stroke(255, 100);
    line(vec.x, vec.y, target.x, target.y);
  }
}
