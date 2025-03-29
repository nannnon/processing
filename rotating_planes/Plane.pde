class Plane
{
  static final public float Width = 1;
  static final public float Height = 2;
  static final public float Depth = 0.1;
  
  final float _x;
  final float _y;
  final color _color;
  boolean _rotating;
  float _theta;
  final float _omega;
  
  Plane(float x, float y)
  {
    _x = x;
    _y = y;
    _color = color(random(256), random(256), random(256));
    _rotating = false;
    _theta = 0;
    _omega = random(0.05, 2 * PI / 20);
  }
  
  void Update()
  {
    if (_rotating)
    {
      _theta += _omega;
      
      if (_theta >= 2 * PI * 5)  // 5回転したら止める
      {
        _rotating = false;
        _theta = 0;
      }
    }
  }
  
  void Draw()
  {
    pushMatrix();
    
    translate(_x, _y, 0);
    rotateX(_theta);
    fill(_color);
    //noStroke();
    box(Width, Height, Depth);
    
    popMatrix();
  }
  
  void StartRotating()
  {
    _rotating = true;
  }
}
