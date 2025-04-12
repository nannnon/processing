class RotatingText
{
  final String _text;
  final PVector _centerPos;
  final float _radius;
  float _theta;
  final float _omega;
  final float _phi;
  final color _color;
  
  RotatingText(String text, float radius, float theta, float omega, float phi, color c)
  {
    _text = text;
    _centerPos = new PVector(0, 0, 0);
    _radius = radius;
    _theta = theta;
    _omega = omega;
    _phi = phi;
    _color = c;
  }
  
  void update()
  {
    _theta += _omega;
  }
  
  private void displayChar(char c, float theta)
  {
    textSize(20);
    fill(_color);
    
    pushMatrix();
    
    translate(_centerPos.x, _centerPos.y, _centerPos.z);
    rotateX(_phi);
    rotateY(theta);
    translate(0, 0, _radius);
    text(c, 0, 0, 0);
    
    popMatrix();
  }
  
  void display()
  {
    for (int i = 0; i < _text.length(); ++i)
    {
      char c = _text.charAt(i);
      float theta = _theta + i * PI / 20;
      displayChar(c, theta);
    }
  }
}
