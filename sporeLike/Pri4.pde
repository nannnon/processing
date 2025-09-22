class Pri4 extends Primitive
{
  Pri4(PVector pos, PVector vel, float dAngle)
  {
    // float hcRadius, PVector pos, PVector vel, float dAngle
    super(600, pos, vel, dAngle);
  }
  
  @Override
  public void display()
  {
    colorMode(HSB, 1);
    
    noStroke();
    for (float r = _hitCircleRadius; r > 0; r -= 20)
    {
      fill(r / _hitCircleRadius, 0.5, 0.5);
      circle(_position.x, _position.y, 2 * r);
    }
    
    colorMode(RGB, 255);
  }
}
