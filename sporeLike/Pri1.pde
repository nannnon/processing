class Pri1 extends Primitive
{
  Pri1(PVector pos, PVector vel, float dAngle)
  {
    // float hcRadius, PVector pos, PVector vel, float dAngle
    super(30, pos, vel, dAngle);
  }
  
  @Override
  public void display()
  {
    float theta = _angle;
    PVector[] points = new PVector[3];
    for (int i = 0; i < points.length; ++i, theta += 2*PI/3)
    {
      float x = _position.x + _hitCircleRadius * cos(theta);
      float y = _position.y + _hitCircleRadius * sin(theta);
      points[i] = new PVector(x, y);
    }
    
    noFill();
    stroke(0, 0, 255);
    triangle(points[0].x, points[0].y,
             points[1].x, points[1].y,
             points[2].x, points[2].y);
  }
}
