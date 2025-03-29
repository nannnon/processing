class TargetLine
{
  static final int targetTime = 60;
  
  PVector _startPoint;
  boolean _startWithX;
  PVector _endPoint;
  int _counter;
  color _color;
  PVector _wayPoint;
  
  TargetLine(float x, float y, boolean s)
  {
    _startPoint = new PVector(x, y);
    _startWithX = s;
  }
  
  void setTarget(float x, float y)
  {
    _endPoint = new PVector(x, y);
    _counter = 0;
    colorMode(RGB, 1);
    _color = color(random(1), random(1), random(1));
    _wayPoint = getWayPoint(_startPoint, _endPoint, _startWithX);
  }
  
  void display()
  {
    final float sw = 20;
    
    if (_counter < targetTime / 2.0)
    {
      PVector diff = PVector.sub(_wayPoint, _startPoint);
      float ratio = float(_counter) / (targetTime / 2.0);
      PVector cur = PVector.add(_startPoint, PVector.mult(diff, ratio));
      
      noFill();
      strokeWeight(sw);
      stroke(_color);
      line(_startPoint.x, _startPoint.y, cur.x, cur.y);
    }
    else
    {
      PVector diff = PVector.sub(_endPoint, _wayPoint);
      float ratio = (float(_counter) - targetTime / 2.0) / (targetTime / 2.0);
      PVector cur = PVector.add(_wayPoint, PVector.mult(diff, ratio));
      
      noFill();
      strokeWeight(sw);
      stroke(_color);
      line(_wayPoint.x, _wayPoint.y, cur.x, cur.y);
    }
    
    ++_counter;
  }
  
  PVector getWayPoint(PVector s, PVector e, boolean x)
  {
    PVector w = new PVector();
    
    if (x)
    {
      w.x = s.x + e.x - s.x;
      w.y = s.y;
    }
    else
    {
      w.y = s.y + e.y - s.y;
      w.x = s.x;
    }
    
    return w;
  }
}
