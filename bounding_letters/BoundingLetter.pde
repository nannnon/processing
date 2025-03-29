class BL
{
  final float g = 0.098;
  
  char _letter;
  float _lSize;
  color _lColor;
  float _x;
  float _y;
  float _vx;
  float _vy;
  
  BL(char l, float ls, color lc, float x, float y, float vx, float vy)
  {
    _letter = l;
    _lSize = ls;
    _lColor = lc;
    _x = x;
    _y = y;
    _vx = vx;
    _vy = vy;
  }
  
  void update()
  {
    _x += _vx;
    if (_x < 0)
    {
      _vx = -_vx;
      _x = 0;
    }
    else if (_x + _lSize >= width)
    {
      _vx = -_vx;
      _x = width - 1 - _lSize;
    }
    
    _vy += g;
    _y += _vy;
    if (_y >= height)
    {
      _vy = -_vy;
      _y = height - 1;
    }
  }
  
  void display()
  {
    textSize(_lSize);
    textAlign(LEFT);
    fill(_lColor);
    text(_letter, _x, _y);
  }
}
