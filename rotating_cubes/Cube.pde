enum State
{
  Idle,
  Rotate0,
  Rotate1
}

class Cube
{
  float _x;
  float _y;
  color _color;
  float _radian;
  float _omega;
  float _scale;
  State _state;
  
  static final float cubeSize = 15;
  static final float maxScalingFactor = 4;
  
  Cube(float x, float y)
  {
    _x = x;
    _y = y;
    
    colorMode(RGB, 1);
    _color = color(random(1), random(1), random(1));
    _radian = 0;
    _omega = 0;
    _scale = 1;
    _state = State.Idle;
  }
  
  void update()
  {
    final float omegaStep = 0.001;
    final float scaleStep = 0.01;
    
    if (_state == State.Rotate0)
    {
      _omega += omegaStep;
      _radian += _omega;
      
      _scale += scaleStep;
      
      if (_scale >= maxScalingFactor)
      {
        _state = State.Rotate1;
      }
    }
    else if (_state == State.Rotate1)
    {
      _omega -= omegaStep;
      _radian += _omega;
      
      _scale -= scaleStep;
      
      if (_scale <= 1)
      {
        _state = State.Idle;
      }
    }
  }
  
  void display()
  {
    pushMatrix();
    
    translate(_x, _y);
    rotate(_radian);
    scale(_scale);
    translate(-cubeSize / 2, -cubeSize / 2);
    
    noStroke();
    colorMode(RGB, 1);
    fill(_color);
    rect(0, 0, cubeSize, cubeSize);
    
    popMatrix();
  }
  
  void startRotation()
  {
    if (_state == State.Idle)
    {
      _state = State.Rotate0;
    }
  }
}
