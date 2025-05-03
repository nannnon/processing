class Line
{
  final SmallSphere _s0;
  final SmallSphere _s1;
  
  Line(SmallSphere s0, SmallSphere s1)
  {
    _s0 = s0;
    _s1 = s1;
  }
  
  void display()
  {
    PVector c0 = _s0.getCoord();
    PVector c1 = _s1.getCoord();
    
    noFill();
    stroke(255, 128);
    line(c0.x, c0.y, c0.z, c1.x, c1.y, c1.z);
  }
}
