class Point
{
  final PVector _vec;
  final color _color;
  
  Point(PVector vec)
  {
    _vec = vec;
    _color = color(random(256), random(256), random(256));
  }
  
  void display()
  {
    //stroke(_color);
    //point(_vec.x, _vec.y, _vec.z);
    
    noStroke();
    fill(_color);
    pushMatrix();
    translate(_vec.x, _vec.y, _vec.z);
    sphere(0.025);
    popMatrix();
  }
}
