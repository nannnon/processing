class TargetPoint
{
  final int MaxCount = 25;
  
  int _x;
  int _y;
  
  boolean _moving;
  int _destX;
  int _destY;
  int _counter;
  
  TargetPoint()
  {
    _x = horNum / 2;
    _y = verNum / 2;
    
    _moving = false;
    _destX = _x;
    _destY = _y;
    _counter = 0;
  }
  
  PVector getCoord()
  {
    PVector origin = int2float(_x, _y);
    PVector dest = int2float(_destX, _destY);
    
    float alpha = float(_counter) / MaxCount;
    float x = (1 - alpha) * origin.x + alpha * dest.x;
    float y = (1 - alpha) * origin.y + alpha * dest.y;
    
    return new PVector(x, y);
  }
  
  void update()
  {
    if (_moving)
    {
      ++_counter;
      if (_counter == MaxCount)
      {
        _x = _destX;
        _y = _destY;
        _moving = false;
      }
    }
    else
    {
      int destX = 0, destY = 0;
      do
      {
        // 4方向のいずれか
        int i = int(random(4));
        switch (i)
        {
          case 0: destX =  0; destY =  1; break;
          case 1: destX =  1; destY =  0; break;
          case 2: destX =  0; destY = -1; break;
          case 3: destX = -1; destY =  0; break;
          default: throw new IllegalArgumentException();
        }
        
        destX += _x;
        destY += _y;
      }
      while (!isInRange(destX, destY));
      
      _moving = true;
      _destX = destX;
      _destY = destY;
      _counter = 0;
    }
  }
  
  void display()
  {
    final float Len = 20;
    PVector vec = getCoord();
    
    noStroke();
    fill(255, 0, 0);
    rect(vec.x - Len / 2, vec.y - Len / 2, Len, Len);
  }
}
