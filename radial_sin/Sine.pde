class Sine
{
  PVector _pos;
  float _dir;
  color _color;
  
  float _theta;
  
  Sine(float x, float y, float dir, color c)
  {
    _pos = new PVector(x, y);
    _dir = dir;
    _color = c;
    
    _theta = 0;
  }
  
  void update()
  {
    final float omega = 2 * PI / 20;
    _theta += omega;
  }
  
  void display()
  {
    noFill();
    stroke(_color);
    
    PVector p = new PVector(0, 0);
    final int len = width / 2;
    for (int x = 0; x < len; ++x)
    {
      pushMatrix();
      translate(_pos.x, _pos.y);
      rotate(_dir);
      
      float y = 10 * sin(_theta + x * 0.1f);
      line(p.x, p.y, x, y);
      p.x = x;
      p.y = y;
      
      popMatrix();
    }
  }
}
