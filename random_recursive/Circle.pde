class Circle
{
  final Circle _baseCircle;
  final float _r;
  final boolean _last;
  float _theta;
  float _omega;
  
  Circle(Circle baseCircle, float r, boolean last)
  {
    _baseCircle = baseCircle;
    _r = r;
    _last = last;
    _theta = 0;
    _omega = random(-PI/40, PI/40);
  }
  
  void update()
  {
    _theta += _omega;
    
    if (_last)
    {
      g_linePos.add(getPos());
    }
  }
  
  // 円の中心位置を取得
  PVector getCenter()
  {
    float x = 0;
    float y = 0;
    
    if (_baseCircle == null)
    {
      x = width / 2.0;
      y = height / 2.0;
    }
    else
    {
      PVector vec = _baseCircle.getPos();
      x = vec.x;
      y = vec.y;
    }
    
    return new PVector(x, y);
  }
  
  // 円上の特定の位相の位置を取得
  PVector getPos()
  {
    PVector vec = getCenter();
    float x = vec.x + _r * cos(_theta);
    float y = vec.y + _r * sin(_theta);
    
    return new PVector(x, y);
  }
  
  void display()
  {
    final color Color = color(128, 128, 255);
    
    PVector vec = getCenter();
    float x = vec.x;
    float y = vec.y;
    
    noFill();
    stroke(Color);
    circle(x, y, 2 * _r);
  }
}
