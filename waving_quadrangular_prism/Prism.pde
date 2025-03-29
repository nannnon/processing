class Prism
{
  static final float Length = 1;
  static final float Gap = 1;
  
  final float _x;
  final float _z;
  final color _color;
  float _height;
  
  Prism(float x, float z)
  {
    _x = x;
    _z = z;
    _color = color(random(256), random(256), random(256));
    _height = 1;
  }
  
  void Update(float h)
  {
    _height = h;
  }
  
  void Draw()
  {
    pushMatrix();
    
    fill(_color);
    translate(_x, 0, _z);
    box(Length, _height, Length);
    
    popMatrix();
  }
}
