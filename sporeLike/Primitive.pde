abstract class Primitive
{
  final float _hitCircleRadius;
  
  PVector _position;
  final PVector _velocity;
  
  float _angle;
  final float _deltaAngle;
  
  Primitive(float hcRadius, PVector pos, PVector vel, float dAngle)
  {
    if (hcRadius <= 0)
    {
      throw new IllegalArgumentException();
    }
    
    _hitCircleRadius = hcRadius;
    _position = pos;
    _velocity = vel;
    _angle = 0;
    _deltaAngle = dAngle;
  }
  
  boolean isHit()
  {
    if (isHit(AreaSize) || isHit(g_primitives))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  private boolean isHit(PVector area)
  {
    if (_position.x - _hitCircleRadius <= 0 ||
        _position.x + _hitCircleRadius >= area.x ||
        _position.y - _hitCircleRadius <= 0 ||
        _position.y + _hitCircleRadius >= area.y )
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  private boolean isHit(Primitive p)
  {
    float distance = _position.dist(p._position);
    if (distance <= (this._hitCircleRadius + p._hitCircleRadius))
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  private boolean isHit(ArrayList<Primitive> primitives)
  {
    for (Primitive p : primitives)
    {
      if (p == this)
      {
        continue;
      }
      
      if (isHit(p))
      {
        return true;
      }
    }
    
    return false;
  }
  
  void update()
  {
    // 移動(X軸)
    _position.x += _velocity.x;
    if (isHit())
    {
      _position.x -= _velocity.x;
      _velocity.x *= -1;
    }
    
    // 移動(Y軸)
    _position.y += _velocity.y;
    if (isHit())
    {
      _position.y -= _velocity.y;
      _velocity.y *= -1;
    }
    
    // 回転
    _angle += _deltaAngle;
  }
  
  abstract public void display();
}
