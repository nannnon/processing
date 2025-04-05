class MyWindmill
{
  final float _x;
  final float _y;
  final color _color;
  float _theta;
  
  MyWindmill(float x, float y)
  {
    _x = x;
    _y = y;
    _color = color(random(256), random(256), random(256));
    _theta = 0;
  }
  
  void update()
  {
    _theta += PI / 100;
  }
  
  void display()
  {
    fill(_color, 128);
    circle(_x, _y, 10);
    
    for (int i = 0; i < 4; ++i)
    {
      pushMatrix();
      
      translate(_x, _y);
      rotate(PI / 2 * i + _theta);
      rect(10, - 5, 20, 5);
    
      popMatrix();
    }
  }
}
