class Rect
{
  final float _width;
  final float _height;
  final color _color;
  
  float _x;
  float _y;
  float _vx;
  float _vy;
  
  float _theta;
  float _omega;
  
  Rect(float x, float y)
  {
    _width = random(0.1, 100);
    _height = random(0.1, 100);
    _color = color(random(1), 1, random(1));
    
    _x = x;
    _y = y;
    _vx = random(2, 10) * (random(1) < 0.5 ? -1 : 1);
    _vy = random(2, 10) * (random(1) < 0.5 ? -1 : 1);
    
    _theta = 0;
    _omega = random(-PI/10, PI/10);
  }
  
  void update()
  {
    _x += _vx;
    _y += _vy;
    
    _theta += _omega;
    
    // X軸方向で衝突チェック
    {
      boolean isHitX = false;
      for (int i = 0; i < 4; ++i)
      {
        isHitX |= isHit(true, getCorner(i).x);
      }
      if (isHitX) //<>//
      {
        _x -= _vx;
        _vx *= -1;
      }
    }
    
    // Y軸方向で衝突チェック
    {
      boolean isHitY = false;
      for (int i = 0; i < 4; ++i)
      {
        isHitY |= isHit(false, getCorner(i).y);
      }
      if (isHitY)
      {
        _y -= _vy;
        _vy *= -1;
      }
    }
  }
  
  boolean isHit(boolean x, float value)
  {
    if (x)
    {
      if (value < 0 || value >= width)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
    else
    {
      if (value < 0 || value >= height)
      {
        return true;
      }
      else
      {
        return false;
      }
    }
  }
  
  PVector getCorner(int i)
  {
    switch (i)
    {
      case 0:
        return getCorner(new PVector( _width / 2.0,  _height / 2.0));
      case 1:
        return getCorner(new PVector(-_width / 2.0,  _height / 2.0));
      case 2:
        return getCorner(new PVector(-_width / 2.0, -_height / 2.0));
      case 3:
        return getCorner(new PVector( _width / 2.0, -_height / 2.0));
      default:
        throw new IllegalArgumentException();
    }
  }
  
  PVector getCorner(PVector vec)
  {
    vec.rotate(_theta); //<>//
    vec.add(_x, _y);
    return vec;
  }
  
  void display()
  {
    pushMatrix();
    fill(_color);
    translate(_x, _y);
    rotate(_theta);
    rect(-_width / 2.0, -_height / 2.0, _width, _height);
    popMatrix();
  }
}
